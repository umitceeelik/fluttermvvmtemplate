import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/constants/enums/http_request_enum.dart';
import 'package:fluttermvvmtemplate/core/init/network/IResponseModel.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enums/app_theme_enum.dart';
import '../../../../core/init/network/network_manager.dart';
import '../../../../core/init/notifier/theme_notifier.dart';
import '../model/test_model.dart';

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
    final response = await coreDio!.send<List<TestModel>,TestModel> ("x", type: HttpTypes.GET, parseModel: TestModel());

    if(response.data is List<TestModel>) {
      
    } else {
      response.error;
    }
    isLoading = false;
  }
}