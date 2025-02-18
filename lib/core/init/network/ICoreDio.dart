import 'package:fluttermvvmtemplate/core/init/network/IResponseModel.dart';

import '../../base/model/base_model.dart';
import '../../constants/enums/http_request_enum.dart';

abstract class ICoredio {
  Future<IResponseModel<R>> send<R,T extends BaseModel> (
    String path, {
    required HttpTypes type,
    required T parseModel,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    void Function(int, int)? onReceiveProgress
    });
}