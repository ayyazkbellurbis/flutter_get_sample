import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/base/base_controller.dart';

abstract class BasePage<T extends BaseController> extends GetView<T> {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              var result = controller.connectivityResult.value;
              return Visibility(
                visible: result == ConnectivityResult.none,
                child: SizedBox(
                  width: double.infinity,
                  height: 1,
                  child: Container(
                    color: Colors.red,
                  ),
                ),
              );
            }),
            Expanded(
              child: buildView(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildView(BuildContext context);
}
