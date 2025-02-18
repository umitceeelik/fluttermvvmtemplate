import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/view/authenticate/login/view/login_view.dart';
import 'package:fluttermvvmtemplate/view/authenticate/onboard/view/on_board_view.dart';
import 'core/constants/app/app_constants.dart';
import 'core/init/cache/locale_manager.dart';
import 'core/init/lang/language_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/notifier/provider_list.dart';
import 'core/init/notifier/theme_notifier.dart';
import 'view/authenticate/test/view/test_view.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  /// **Önce EasyLocalization'ı başlatıyoruz**
  await EasyLocalization.ensureInitialized();
  await LocaleManager.preferencesInit();

  runApp(
  //   EasyLocalization(
  //     supportedLocales: LanguageManager.instance.supportedLocales,
  //     path: ApplicationConstants.LANG_ASSET_PATH,
  //     fallbackLocale: LanguageManager.instance.enLocale,
  //     child: MultiProvider(
  //       providers: [
  //         ...ApplicationProvider.instance.dependItems
  //       ],
  //       child: const MyApp(),
  //     ),
  //   ),
  // );

  MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      child: EasyLocalization(
        supportedLocales: LanguageManager.instance.supportedLocales,
        path: ApplicationConstants.LANG_ASSET_PATH,
        fallbackLocale: LanguageManager.instance.enLocale,
        child: const MyApp(),
      )
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
      home: OnBoardView(),
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}
