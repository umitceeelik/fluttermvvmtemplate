import 'package:flutter/material.dart';

abstract class BaseViewModel {
  BuildContext? buildContext;
  
  void setContext(BuildContext context);
  void init();
}