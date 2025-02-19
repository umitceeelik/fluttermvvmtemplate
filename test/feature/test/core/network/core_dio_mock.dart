import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_error.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_model.dart';
import 'package:fluttermvvmtemplate/core/constants/enums/http_request_enum.dart';
import 'package:fluttermvvmtemplate/core/extension/network_extension.dart';
import 'package:fluttermvvmtemplate/core/init/network/ICoreDio.dart';
import 'package:fluttermvvmtemplate/core/init/network/IResponseModel.dart';


class CoreDioMock with DioMixin implements ICoreDioFull, Dio {
  final BaseOptions options;

  CoreDioMock(this.options) {
    this.options = options;
    this.interceptors.add(InterceptorsWrapper());
    this.httpClientAdapter = IOHttpClientAdapter();
  }
  @override
  Future<IResponseModel<R>> send<R, T extends BaseModel>(String path,
      {required HttpTypes type,
      required T parseModel,
      data,
      Map<String, dynamic>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) async {
    final response = await request(path,
        data: data, options: Options(method: type.rawValue));

    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        final model = _responseParser<R, T>(parseModel, response.data);
        return ResponseModel<R>(data: model);
      default:
        return ResponseModel(error: BaseError("Unexpected error occurred"));
    }
  }

  Future<IResponseModel<R>> sendNoNetwork<R, T extends BaseModel>(String path,
      {required HttpTypes type,
      required T parseModel,
      data,
      Map<String, dynamic>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) async {
    String dumyJson = """[
            {
              "userId": 1,
              "id": 1,
              "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
              "body": "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto"
            },
            {
              "userId": 1,
              "id": 2,
              "title": "qui est esse",
              "body": "est rerum tempore vitae sequi sint nihil reprehenderit dolor beatae ea dolores neque fugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis qui aperiam non debitis possimus qui neque nisi nulla"
            }
          ]""";
    final response = jsonDecode(dumyJson);

    final model = _responseParser<R, T>(parseModel, response);
        return ResponseModel<R>(data: model);
  }

  R _responseParser<R, T>(BaseModel model, dynamic data) {
    if (data is List) {
      return data.map((e) => model.fromJson(e)).toList().cast<T>() as R;
    } else if (data is Map) {
      return model.fromJson(data.cast<String, dynamic>()) as R;
    }
    return data as R;
  }
}