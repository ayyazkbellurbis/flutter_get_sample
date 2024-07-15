import 'package:flutter/material.dart';
import 'package:sample/app/modules/splash/controllers/splash_controller.dart';
import 'package:sample/base/base_page.dart';

class SplashView extends BasePage<SplashController> {
  @override
  Widget buildView(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("SPLASH SCREEN"),
      ),
    );
  }
}
