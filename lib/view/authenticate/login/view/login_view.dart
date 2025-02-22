import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermvvmtemplate/core/constants/image/image_constants.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';
import 'package:fluttermvvmtemplate/core/extension/string_extension.dart';
import '../../../../core/base/view/base_view.dart';
import '../viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, LoginViewModel value) =>
          DefaultTabController(
        length: 2,
        child: Scaffold(
          key: value.scaffoldState,
          body: SafeArea(
            child: Column(
              children: [
                buildAnimatedContainer(context),
                buildContainerTabBar(context),
                Expanded(
                    flex: 6,
                    child: Padding(
                      padding: context.paddingNormal,
                      child: buildForm(value, context),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildAnimatedContainer(BuildContext context) {
    return AnimatedContainer(
                  duration: context.lowDuration,
                  height: context.mediaQuery.viewInsets.bottom > 0
                      ? 0
                      : context.height * 0.3,
                  color: Colors.white,
                  child: Center(
                      child: Image.asset(ImageConstants.instance.hotDog)));
  }

  Container buildContainerTabBar(BuildContext context) {
    return Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(50)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 50, right: 50, bottom: 5),
                  child: buildTabBar(context),
                ),
              );
  }

  TabBar buildTabBar(BuildContext context) {
    return TabBar(
                      labelColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 5,
                      indicatorColor: context.colors.surface,
                      dividerColor: Colors.transparent,
                      labelStyle: context.textTheme.headlineSmall,
                      tabs: [
                        Tab(
                          text: "    Login    ",
                        ),
                        Tab(
                          text: "   Sign Up   ",
                        )
                      ]);
  }

  Form buildForm(LoginViewModel value, BuildContext context) {
    return Form(
      key: value.formState,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          Spacer(flex: 6),
          buildFormFieldEmail(context),
          buildFormFieldPassword(context, value),
          Spacer(),
          buildTextForgot(),
          Spacer(flex: 6),
          buildElevatedButtonLogin(context),
          buildWrapDontHaveAnAccount(context),
          Spacer(),
        ],
      ),
    );
  }

  Widget buildFormFieldPassword(
          BuildContext context, LoginViewModel viewModel) =>
      Observer(builder: (_) {
        return TextFormField(
          validator: (value) =>
              value!.isNotEmpty ? null : "Password cannot be empty",
          obscureText: viewModel.isLockOpen,
          decoration: InputDecoration(
              labelText: "Password",
              icon: buildContainerIconField(context, Icons.vpn_key),
              suffixIcon: IconButton(
                  icon: Observer(builder: (_) {
                    return Icon(
                        viewModel.isLockOpen ? Icons.lock : Icons.lock_open);
                  }),
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    viewModel.isLockStateChange();
                  })),
        );
      });

  TextFormField buildFormFieldEmail(BuildContext context) {
    return TextFormField(
      validator: (value) => value!.isValidEmail,
      decoration: InputDecoration(
        labelText: "Email",
        icon: buildContainerIconField(context, Icons.email),
      ),
    );
  }

  Container buildContainerIconField(BuildContext context, IconData icon) {
    return Container(
        color: context.colors.onError,
        padding: context.paddingLow,
        child: Icon(icon, color: context.colors.secondary));
  }

  Widget buildTextForgot() =>
      Align(alignment: Alignment.centerRight, child: Text("Forgot Password"));

  ElevatedButton buildElevatedButtonLogin(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colors.surface,
        shape: StadiumBorder(),
      ),
      child: Padding(
        padding: context.paddingNormal,
        child: Center(
            child: Text(
          "Enter To App",
          style: context.textTheme.bodyLarge!
              .copyWith(color: context.colors.onSecondary),
        )),
      ),
    );
  }

  Wrap buildWrapDontHaveAnAccount(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text("Don't have an account?"),
        TextButton(
          onPressed: () {},
          child: Text(
            "Sign Up",
            style: context.textTheme.bodyMedium!
                .copyWith(color: context.colors.surface),
          ),
        )
      ],
    );
  }
}
