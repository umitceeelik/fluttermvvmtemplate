import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_view_model.dart';
import 'package:fluttermvvmtemplate/core/constants/enums/locale_keys_enum.dart';
import 'package:fluttermvvmtemplate/core/constants/navigaton/navigation_constants.dart';
import 'package:fluttermvvmtemplate/core/init/language/locale_keys.g.dart';
import 'package:fluttermvvmtemplate/view/_product/_constants/image_path_svg.dart';
import 'package:fluttermvvmtemplate/view/authenticate/onboard/model/on_board_model.dart';
import 'package:mobx/mobx.dart';
part 'on_board_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase extends BaseViewModel with Store {
  void setContext(BuildContext context) => buildContext = context;
  List<OnBoardModel> onBoardItems = [];

  @observable
  bool isLoading = false;

  @observable
  int currentIndex = 0;

  @action
  void changeCurrentIndex(int value) {
    currentIndex = value;
  }

  void init() {
    onBoardItems.add(OnBoardModel(
        LocaleKeys.onBoard_page1_title,
        LocaleKeys.onBoard_page1_description,
        SvgImagePaths.instance.relaxSVG));

    onBoardItems.add(OnBoardModel(
        LocaleKeys.onBoard_page1_title,
        LocaleKeys.onBoard_page1_description,
        SvgImagePaths.instance.devSVG));

    onBoardItems.add(OnBoardModel(
        LocaleKeys.onBoard_page1_title,
        LocaleKeys.onBoard_page1_description,
        SvgImagePaths.instance.selfieSVG));
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  Future<void> completeToOnBoard() async {
    changeLoading();
    await localeManager.setBoolValue(PreferencesKeys.IS_FIRST_APP, true);
    changeLoading();
    navigation.navigateToPageClear(path: NavigationConstants.TEST_VIEW);
  }
}
