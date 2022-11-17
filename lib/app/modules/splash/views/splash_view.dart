import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mtracker/app/modules/home/controllers/home_controller.dart';

import '../controllers/splash_controller.dart'; 

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    homeController.onInit();
    final controller = Get.put(SplashController());
    controller.onInit();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(255, 101, 209, 190),
        child:const Center(
          child: Image(
            image: AssetImage('assets/images/splash_logo.png'),
            width: 180,
            height: 180,
          ),
        ), 
        ),
      );
  }
}
