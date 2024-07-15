import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/app/modules/auth/start/controllers/auth_start_controller.dart';
import 'package:sample/app/modules/home/views/home_view.dart';
import 'package:sample/app/routes/app_pages.dart';
import 'package:sample/base/base_page.dart';
import 'package:sample/utils/widgets/buttons/primary_filled_button.dart';

class AuthStartView extends BasePage<AuthStartController> {
  const AuthStartView({super.key});

  static launch() => Get.offAllNamed(Routes.AUTH_START);

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PrimaryFilledButton(
          text: "START AUTH",
          onTap: () {
            HomeView.launch();
          },
        ),
      ),
    );
  }
}
