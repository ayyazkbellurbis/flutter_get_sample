import 'package:get/get.dart';
import 'package:sample/app/modules/auth/start/bindings/auth_start_binding.dart';
import 'package:sample/app/modules/auth/start/views/auth_start_view.dart';
import 'package:sample/app/modules/home/bindings/home_binding.dart';
import 'package:sample/app/modules/home/views/home_view.dart';
import 'package:sample/app/modules/splash/bindings/splash_binding.dart';
import 'package:sample/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  final String? payload;

  AppPages({required this.payload});

  get pages => [
        GetPage(
          name: Routes.SPLASH,
          page: () => SplashView(),
          binding: SplashBinding(payload: payload),
        ),
        GetPage(
          name: Routes.AUTH_START,
          page: () => AuthStartView(),
          binding: AuthStartBinding(),
        ),
        GetPage(
          name: Routes.HOME,
          page: () => HomeView(),
          binding: HomeBinding(),
        ),
      ];
}
