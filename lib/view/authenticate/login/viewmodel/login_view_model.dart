import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_view_model.dart';
import 'package:mobx/mobx.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase extends BaseViewModel with Store{
  
  void setContext(BuildContext context) => buildContext = context;

  void init() {}

  @observable
  String? email;

  @action
  void changeEmail(String value) {
    email = value;
  }
}