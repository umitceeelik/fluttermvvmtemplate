import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboard_mock_view_model.dart';

void main() {

  OnBoardMockViewModel? mockViewModel;
  IStringHelper? stringHelper;
  setUp(() {
    SharedPreferences.setMockInitialValues({"token": "dsadsad"});

    mockViewModel = OnBoardMockViewModel();
    stringHelper = MockStringHelper();

    mockViewModel!.init();
  });

  test("String Helper Upper Case", () {
    String text = "Hello";
    text = stringHelper!.toUpper(text);
    expect(text.contains(RegExp("[A-Z\s]+")), true);
  });

  test("OnBoard Get Models", () async{
    await mockViewModel!.onBoardGetModels();
    expect(mockViewModel!.onBoardModel!, isNotEmpty);
  });

  test("OnBoard Get Service Request", () async {
    expect(mockViewModel!.isLoading, false);
    mockViewModel!.getServiceRequest();
    expect(mockViewModel!.isLoading, true);
  });

  test("OnBoard On Page Changed", () {
    mockViewModel!.onPageChanged(5);
    expect(5, mockViewModel!.currentPageIndex);
  });

  group("Test All", () {
    int index = 0;
    test("OnBoard Get Models", () async {
      await mockViewModel!.onBoardGetModels();
      index = mockViewModel!.onBoardModel!.length;
      expect(mockViewModel!.onBoardModel!, isNotEmpty);
    });
    test("OnBoard On Page Changed", () {
      mockViewModel!.onPageChanged(index);
      expect(index, mockViewModel!.currentPageIndex);
    });
  });
}