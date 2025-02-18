

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../../base/model/base_error.dart';
import '../../base/model/base_model.dart';
import '../../constants/enums/http_request_enum.dart';
import '../../extension/network_extension.dart';
import 'ICoreDio.dart';
import 'IResponseModel.dart';

part './network_core/core_operations.dart';

class CoreDio with DioMixin implements Dio, ICoredio {
  final BaseOptions options;

  CoreDio(this.options) {
    this.options = options;
    this.interceptors.add(InterceptorsWrapper());

    this.httpClientAdapter = IOHttpClientAdapter();
  }

  Future<IResponseModel<R>> send<R,T extends BaseModel> (
    String path, {
    required HttpTypes type,
    required T parseModel,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    void Function(int, int)? onReceiveProgress
    }) async {    
    final response = await request(
      path,
      data: data,
      options: Options(
        method: type.rawValue
        )
    );
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        final model = _responseParser<R>(parseModel, _responseParser);
        return ResponseModel<R>(data: model);
      default:
        return ResponseModel(error: BaseError("Unexpected error occurred"));
    }
  }
}