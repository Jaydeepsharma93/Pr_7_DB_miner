import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      Get.offNamed('/home');
    });
    return Scaffold(
      body: Center(
        child: Image.asset('assets/img/qc.png'),
      ),
    );
  }
}
