import 'package:flutter/material.dart';
import '../../init/network/ICoreDio.dart';
import '../../init/network/network_manager.dart';

abstract class BaseViewModel {
  BuildContext? buildContext;
  
  ICoreDio? coreDio = NetworkManager.instance.coreDio;
  void setContext(BuildContext context);
  void init();
}