import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/controller.dart';

class DetailScreen extends StatelessWidget {
  final ApiCalling apiCalling = Get.put(ApiCalling());

  DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/img/${apiCalling.index}.jpg'),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                    Text(
                      apiCalling.quoteData[apiCalling.index.value].type
                          .toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
              Spacer(
                flex: 3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Text(
                  apiCalling.quoteData[apiCalling.index.value].quote.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                "-  ${apiCalling.quoteData[apiCalling.index.value].author}",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500),
              ),
              Spacer(
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Obx(
                    () => IconButton(
                        onPressed: () {
                          apiCalling.toggleLike(
                              apiCalling.quoteData[apiCalling.index.value],
                              apiCalling.index.value);
                        },
                        icon: Icon(
                          apiCalling.quoteData[apiCalling.index.value].id == "1"
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color:
                              apiCalling.quoteData[apiCalling.index.value].id ==
                                      "1"
                                  ? Colors.red
                                  : Colors.white,
                          size: 40,
                        )),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share,
                        size: 40,
                        color: Colors.white,
                      ))
                ],
              ),
              Spacer(
                flex: 3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
