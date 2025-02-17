import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/base/state/base_state.dart';
import 'package:fluttermvvmtemplate/core/base/view/base_view.dart';
import 'package:fluttermvvmtemplate/core/constants/enums/locale_keys_enum.dart';
import 'package:fluttermvvmtemplate/core/extension/string_extension.dart';
import 'package:fluttermvvmtemplate/core/init/cache/locale_manager.dart';
import 'package:fluttermvvmtemplate/core/init/lang/language_manager.dart';
import 'package:fluttermvvmtemplate/core/init/language/locale_keys.g.dart';
import 'package:fluttermvvmtemplate/view/authenticate/test/viewmodel/test_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TestsView extends StatefulWidget {
  const TestsView({super.key});

  @override
  State<TestsView> createState() => _TestsViewState();
}

class _TestsViewState extends BaseState<TestsView> {
  TestViewModel? viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
      viewModel: TestViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        viewModel = model;
      },
      onPageBuilder: (context, value) => scaffoldBody,
    );
  }

  Widget get scaffoldBody => Scaffold(
    appBar: appBar(),
    floatingActionButton: floatingActionButtonNumberIncrement,
    body: textNumber,
  );

  AppBar appBar() {
    return AppBar(
      leading: Text(LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)),
      title: textWelcomeWidget,
      actions: [iconButtonChangeTheme],
    );
  }

  IconButton get iconButtonChangeTheme {
    return IconButton(
        icon: Icon(Icons.change_history),
        onPressed: () {
          context.locale = LanguageManager.instance.enLocale;
        },
      );
  }

  Widget get textNumber {
    return Column(
      children: [
        mailField,
        Observer(
          builder: (context) => Center(
            child: Text(
              viewModel!.number.toString()
            ),
          ),
        ),
      ],
    );
  }

  Text get textWelcomeWidget {
    return Text(LocaleKeys.welcome.locale);
  }

  FloatingActionButton get floatingActionButtonNumberIncrement {
    return FloatingActionButton(
      onPressed: () => viewModel!.incrementNumber(),
      child: Icon(Icons.add),
    );
  }
}

extension _FormArea on _TestsViewState {
  TextFormField get mailField => TextFormField(
    validator: (value) => value!.isValidEmail,
  );
}

