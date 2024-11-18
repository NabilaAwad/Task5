import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task5/app/modules/home/views/responsiveWidgets.dart';

import '../controllers/home_controller.dart';
import 'login.dart';

class OnBoardingScreens extends StatefulWidget {
  @override
  State<OnBoardingScreens> createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  late HomeController controller;
  final box = GetStorage();

  @override
  void initState() {
    super.initState();

    controller = Get.put(HomeController());
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: (int page) {
              setState(() {
                controller.currentPage = page;
              });
            },
            children: [
              onBoardingPage(
                  color: Colors.blueAccent,
                  title: 'Shopy',
                  description: 'In Shopy, you can explore everything you need, from fashion to electronics!',
                  img: 'images/2.webp'),
              onBoardingPage(
                  color: Colors.blueAccent,
                  title: 'Fast Delivery',
                  description: 'Get your orders delivered quickly and securely right to your door!',
                  img: 'images/4.jpg'),
              onBoardingPage(
                  color: Colors.blueAccent,
                  title: 'Secure Payment',
                  description: 'Experience safe and secure transactions with multiple payment options',
                  img: 'images/5.jpg'),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) => Animated_tran(index: index, currentPage: controller.currentPage)),
            ),
          ),
          Positioned(
            bottom: 60,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                if (controller.currentPage == 2) {
                  box.write('onboardingCompleted', true);
                  Get.off(() => Login());
                } else {
                  controller.pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                }
              },
              child: Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.pageController.dispose();
    super.dispose();
  }
}
