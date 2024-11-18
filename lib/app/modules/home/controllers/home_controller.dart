import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task5/app/modules/home/views/login.dart';
import 'package:task5/app/modules/home/views/onboarding_screens.dart';

class HomeController extends GetxController {

  late PageController pageController ;
  late int currentPage;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    currentPage = 0;
    checkInitialScreen();
  }
  void checkInitialScreen() {

    bool hasCompletedOnboarding = box.read('onboardingCompleted') ?? false;
    bool isLoggedIn = box.read('isLoggedIn') ?? false;

    if (isLoggedIn) {

      Get.offNamed('/home');
    } else if (hasCompletedOnboarding) {

      Get.offNamed('/login');
    } else {

      Get.offNamed('/onBoarding');
    }
  }




  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {

    super.onClose();
  }


}
