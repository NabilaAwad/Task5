import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/login.dart';
import '../modules/home/views/mainScreen.dart';
import '../modules/home/views/onboarding_screens.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () =>  Mainscreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () =>  Login(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.onBoarding,
      page: () =>  OnBoardingScreens(),
      binding: HomeBinding(),
    ),
  ];
}
