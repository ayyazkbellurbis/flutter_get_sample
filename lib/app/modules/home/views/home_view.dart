import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/app/modules/home/controllers/home_controller.dart';
import 'package:sample/app/routes/app_pages.dart';
import 'package:sample/base/base_page.dart';
import 'package:sample/utils/widgets/buttons/primary_filled_button.dart';

class HomeView extends BasePage<HomeController> {
  static launch({String? payload}) =>
      Get.offAllNamed(Routes.HOME, arguments: payload);

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PrimaryFilledButton(
            text: "Next Screen",
            onTap: () {
              //TODO
            }),
      ),
    );
  }
}
