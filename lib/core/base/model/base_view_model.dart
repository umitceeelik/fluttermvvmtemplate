import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/init/network/ICoreDio.dart';
import 'package:fluttermvvmtemplate/core/init/network/network_manager.dart';

abstract class BaseViewModel {
  BuildContext? buildContext;
  
  ICoredio? coreDio = NetworkManager.instance.coreDio;
  void setContext(BuildContext context);
  void init();
}