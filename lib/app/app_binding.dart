import 'package:get/get.dart';
import 'package:sample/app/data/network/network_requester.dart';
import 'package:sample/app/data/repository/user_repository.dart';
import 'package:sample/app/modules/home/controllers/home_controller.dart';

class AppBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(NetworkRequester(), permanent: true);
    Get.put(UserRepository(), permanent: true);
    Get.put(HomeController(),permanent: true);
  }

}
