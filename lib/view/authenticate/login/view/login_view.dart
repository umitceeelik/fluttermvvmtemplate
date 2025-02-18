import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/view/_widgets/button/face_book_button.dart';
import 'package:fluttermvvmtemplate/view/_widgets/button/login_button.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/button/icon_button.dart';
import '../../../../core/extension/context_extension.dart';
import '../viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {

  LoginViewModel? viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onPageBuilder: (BuildContext context,LoginViewModel value) => buildScaffold(context),
    );
  }

  Scaffold buildScaffold(BuildContext context) => Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          decoration: InputDecoration(
            // hintText: "Username",
            enabledBorder: OutlineInputBorder(),
          ),
        ),
        FaceBookButton(onComplete: (data, {errorMessage}) {
          if (data != null) {}
          else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage!)));
          }
        },)
      ],
    ),
  );

  Text buildText(BuildContext context) {
    return Text(
          "hello",
          style: context.textTheme.headlineLarge!.copyWith(color: context.colors.primary),
        );
  }
}