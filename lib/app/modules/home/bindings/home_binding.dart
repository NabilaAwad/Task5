import 'package:get/get.dart';
import 'package:task5/app/modules/home/views/login.dart';

import '../controllers/home_controller.dart';
import '../controllers/mainScreenController.dart';
import '../controllers/products_detailesController.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<MainScreenController>(
          () => MainScreenController(),
    );
    Get.lazyPut<Detailes>(
          () => Detailes(),
    );

  }
}
