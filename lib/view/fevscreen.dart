import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/controller.dart';

class FevScreen extends StatelessWidget {
  final ApiCalling apiCalling = Get.put(ApiCalling());

  FevScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Quotes"),
        centerTitle: true,
      ),
      body: Obx(() {
        if (apiCalling.likedQuotes.isEmpty) {
          return Center(
            child: Text(
              'No Any quotes',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        } else {
          // Ensure randomNumber is used correctly
          int randomNumber = generateRandomNumber();
          return ListView.builder(
            itemCount: apiCalling.likedQuotes.length,
            // Assuming a fixed number of items
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/img/${randomNumber + index}.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text(
                          apiCalling.likedQuotes[index].quote.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                        subtitle: Text(
                          "- ${apiCalling.likedQuotes[index].type}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )),
              );
            },
          );
        }
      }),
    );
  }

  int generateRandomNumber() {
    Random random = Random();
    return random.nextInt(10) + 1;
  }
}
