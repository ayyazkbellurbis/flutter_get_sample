import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sample/app/data/repository/user_repository.dart';
import 'package:sample/app/modules/auth/start/views/auth_start_view.dart';
import 'package:sample/app/modules/home/views/home_view.dart';
import 'package:sample/base/base_controller.dart';
import 'package:sample/utils/storage/storage_utils.dart';

class SplashController extends BaseController<UserRepository>
    with SingleGetTickerProviderMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  String? payload;

  SplashController({required this.payload});

  // Observable variable for count
  var count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );

    animationController.forward();

    String language = repository.getLanguage()!;
    final values = language.split('_');
    Get.updateLocale(Locale(values[0], values[1]));
  }

  @override
  void onReady() {
    super.onReady();
    navigateToHome();
  }

  Future<void> navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    final user = Storage.getUser();

    if (user != null) {
      return HomeView.launch(payload: payload);
    } else {
      return AuthStartView.launch();
    }
  }


  // Method to increment the count
  void increment() {
    count++;
  }

  // Method to decrement the count
  void decrement() {
    if (count > 0) {
      count--;
    }
  }

  @override
  void onClose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
    animationController.dispose();
    super.onClose();
  }
}
