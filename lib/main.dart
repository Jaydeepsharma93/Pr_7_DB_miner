import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_7_db_miner/view/Homescreen.dart';
import 'package:pr_7_db_miner/view/detailscreen.dart';
import 'package:pr_7_db_miner/view/fevscreen.dart';
import 'package:pr_7_db_miner/view/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => SplashScreen(),
          transition: Transition.circularReveal,
        ),
        GetPage(
          name: '/home',
          page: () => HomeScreen(),
          transition: Transition.circularReveal,
        ),
        GetPage(
            name: '/detail',
            page: () => DetailScreen(),
            transition: Transition.circularReveal),
        GetPage(
            name: '/fev',
            page: () => FevScreen(),
            transition: Transition.leftToRightWithFade)
      ],
    );
  }
}
