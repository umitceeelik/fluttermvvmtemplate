import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/view/authenticate/onboard/model/on_board_model.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';

part 'on_board_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase extends BaseViewModel with Store {
  void setContext(BuildContext context) => buildContext = context;

  void init() {
    onBoardModel = List.generate(5, (index) => OnBoardModel(index.toString()));
  }
  
  List<OnBoardModel>? onBoardModel;

  @observable
  int currentPageIndex = 0;

  @action
  void onPageChanged(int value) {
    currentPageIndex = value;
  }
}