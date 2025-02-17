import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_view_model.dart';
import 'package:fluttermvvmtemplate/core/constants/enums/app_theme_enum.dart';
import 'package:fluttermvvmtemplate/core/init/network/network_manager.dart';
import 'package:fluttermvvmtemplate/core/init/notifier/theme_notifier.dart';
import 'package:fluttermvvmtemplate/view/authenticate/test/model/test_model.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase extends BaseViewModel with Store{

  @override
  void setContext(BuildContext context) => buildContext = context;

  @override
  void init() {}

  @observable
  bool isLoading = false;

  @observable
  int number = 0;

  @computed
  bool get isEven => number % 2 == 0;

  @action
  void incrementNumber() {
    number++;
  }

  
  void changeTheme() {
    Provider.of<ThemeNotifier>(buildContext!, listen: false).changeTheme(AppThemes.DARK);
  }

  @action
  Future<void> getSampleRequest() async{
    isLoading = true;
    await NetworkManager.instance.dioGet<TestModel>("x", TestModel());
    isLoading = false;
  }
}