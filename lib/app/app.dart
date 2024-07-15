import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/app/app_binding.dart';
import 'package:sample/app/data/values/constants.dart';
import 'package:sample/app/data/values/env.dart';
import 'package:sample/app/data/values/localization.dart';
import 'package:sample/app/routes/app_pages.dart';
import 'package:sample/app/theme/app_theme.dart';

class App extends StatelessWidget {

  final String? payload;

  const App({
    Key? key,
    this.payload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppPages appPages = AppPages(payload: payload);

    return GetMaterialApp(
      title: Env.title,
      translations: Localization(),
      locale: const Locale('en', 'US'),
      navigatorKey: GlobalKeys.navigationKey,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: Routes.SPLASH,
      getPages: appPages.pages,
      defaultTransition: Transition.fade,
      initialBinding: AppBinding(),
    );
  }
}
