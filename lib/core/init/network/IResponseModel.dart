import 'package:fluttermvvmtemplate/core/base/model/base_error.dart';

abstract class IResponseModel<T> {
  T? data;
  IErrorModel? error;
}

abstract class IErrorModel<T> {
  void statusCode() {}
}

class ResponseModel<T> extends IResponseModel<T> {

  T? data;
  IErrorModel? error;

  ResponseModel({this.data, this.error});
}