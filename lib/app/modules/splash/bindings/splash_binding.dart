import 'package:get/get.dart';
import 'package:sample/app/modules/splash/controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  String? payload;

  SplashBinding({
    required this.payload,
  });

  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController(payload: payload));
  }
}
