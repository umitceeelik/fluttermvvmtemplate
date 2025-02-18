import 'dart:io';

import 'package:dio/dio.dart';
import 'ICoreDio.dart';
import 'core_dio.dart';
import '../../base/model/base_error.dart';
import '../../base/model/base_model.dart';
import '../../constants/enums/locale_keys_enum.dart';
import '../cache/locale_manager.dart';

class NetworkManager {
  static final NetworkManager _instance = NetworkManager._init();
  static NetworkManager get instance => _instance;

  ICoredio? coreDio;

  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com/",
      headers: {
        "Content-Type": "application/json",
        "Authorization" : "Bearer ${LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)}",
      },
    );
    // _dio = Dio(baseOptions);

    coreDio = CoreDio(baseOptions);

    // _dio?.interceptors.add(InterceptorsWrapper(
    //   onRequest: (options, handler) {
    //     options.path += "umit";
    //     return handler.next(options); //continue
    //   },
    //   // onResponse: (response, handler) {
    //   //   // Do something with response data
    //   //   return handler.next(response.data); // continue
    //   // },
    //   onError: (DioException e, handler) {
    //     // DioError mesajını alıp BaseError'a çeviriyoruz
    //     final baseError = BaseError(e.message ?? "Unknown error occurred");

    //     return handler.reject(
    //       DioException(
    //         requestOptions: e.requestOptions,
    //         response: e.response,
    //         type: e.type,
    //         error: baseError, // Burada hata modelimizi set ediyoruz
    //       ),
    //     );// continue
    //   },
    // ));
  }
}