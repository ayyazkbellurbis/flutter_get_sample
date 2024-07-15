import 'package:get/get.dart';
import 'package:sample/app/modules/auth/start/controllers/auth_start_controller.dart';

class AuthStartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthStartController>(() => AuthStartController());
  }
}
