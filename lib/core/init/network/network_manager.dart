import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_error.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_model.dart';
import 'package:fluttermvvmtemplate/core/constants/enums/locale_keys_enum.dart';
import 'package:fluttermvvmtemplate/core/init/cache/locale_manager.dart';

class NetworkManager {
  static final NetworkManager _instance = NetworkManager._init();
  static NetworkManager get instance => _instance;

  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com/",
      headers: {
        "Content-Type": "application/json",
        "Authorization" : "Bearer ${LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)}",
      },
    );
    _dio = Dio(baseOptions);

    _dio?.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.path += "umit";
        return handler.next(options); //continue
      },
      // onResponse: (response, handler) {
      //   // Do something with response data
      //   return handler.next(response.data); // continue
      // },
      onError: (DioException e, handler) {
        // DioError mesajını alıp BaseError'a çeviriyoruz
        final baseError = BaseError(e.message ?? "Unknown error occurred");

        return handler.reject(
          DioException(
            requestOptions: e.requestOptions,
            response: e.response,
            type: e.type,
            error: baseError, // Burada hata modelimizi set ediyoruz
          ),
        );// continue
      },
    ));
  }

  Dio? _dio; 

  Future dioGet<T extends BaseModel>(String path, T model) async{
    final response = await _dio?.get(path);

    switch (response?.statusCode) {
      case HttpStatus.ok:
        final responseBody = response?.data;

        if (responseBody is List) {
          return responseBody.map((e) => model.fromJson(e)).toList();
        } else if (responseBody is Map) {
          return model.fromJson(responseBody.cast<String, dynamic>());
          // model.fromJson(responseBody);
        } 
        return responseBody;
      default:
        break;
    }
  }
}