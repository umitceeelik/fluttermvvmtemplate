
import 'package:fluttermvvmtemplate/core/base/model/base_error.dart';
import 'package:vexana/vexana.dart';

class VexanaManager {
  static VexanaManager? _instance;
  static VexanaManager get instance {
    _instance ??= VexanaManager.init();
    return _instance!;
  }
  VexanaManager.init();

  // INetworkManager manager = NetworkManager(
  //   isEnableLogger: true,
  //   options: BaseOptions(
  //     baseUrl: 'https://jsonplaceholder.typicode.com',
  //   ),
  // );
}