
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_view_model.dart';
import 'package:mobx/mobx.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase extends BaseViewModel with Store {
  
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  void setContext(BuildContext context) => buildContext = context;
  void init() {}

  @observable
  bool isLoading = false;

  @observable
  bool isLockOpen = false;

  void fetchLoginService() {
    isLoading = true;
    // await service.login();
    isLoading = false;
  }

  @action
  void isLockStateChange() {
    isLockOpen = !isLockOpen;
  }
}