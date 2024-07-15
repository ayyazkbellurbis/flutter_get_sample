import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class BaseController<T> extends GetxController {
  // Fetch the repository from GetX dependency injection
  T get repository => Get.find<T>();

  final Connectivity _connectivity = Connectivity();
  var connectivityResult = Rx<ConnectivityResult>(ConnectivityResult.none);

  @override
  void onInit() {
    super.onInit();
    // Subscribe to connectivity changes
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      connectivityResult.value = result;
    });
  }
}