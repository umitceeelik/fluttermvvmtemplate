

import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttermvvmtemplate/core/constants/enums/http_request_enum.dart';
import 'package:fluttermvvmtemplate/core/init/network/ICoreDio.dart';
import 'package:fluttermvvmtemplate/core/init/network/core_dio.dart';
import 'package:fluttermvvmtemplate/view/authenticate/onboard/model/on_board_model.dart';
import 'package:fluttermvvmtemplate/view/authenticate/onboard/viewModel/on_board_view_model.dart';
import 'package:mobx/src/core.dart';

import '../test/core/network/dio_mock_model.dart';

/*
class OnBoardMockViewModel implements OnBoardViewModel {
  @override
  BuildContext? buildContext;

  @override
  ICoreDio? coreDio;

  IStringHelper? stringHelper;

  @override
  int currentPageIndex = 0;

  bool isLoading = false;

  @override
  List<OnBoardModel>? onBoardModel;

  @override
  void init() {
    coreDio = CoreDio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

    stringHelper = MockStringHelper();
  }

  @override
  void onPageChanged(int value) {
    currentPageIndex = value;
  }

  Future<void> onBoardGetModels() async{
    final response = await coreDio!.send<List<PostModel>, PostModel>("/posts",
        type: HttpTypes.GET, parseModel: PostModel());

    if(response.data is List) {
      onBoardModel = response.data?.map((e) => OnBoardModel(stringHelper!.toUpper(e.title ??= "null oe"))).toList().cast<OnBoardModel>();
    }
  }

  Future<void> getServiceRequest()  async {
    isLoading = true;
    await onBoardGetModels();
    isLoading = false;
  }

  @override
  void setContext(BuildContext context) {
  }
  
  @override
  ReactiveContext get context => throw UnimplementedError();
}

abstract class IStringHelper {
  String toUpper(String data);
}

class MockStringHelper extends IStringHelper {
  @override
  String toUpper(String data) {
    return data.toUpperCase();
  }
}
*/