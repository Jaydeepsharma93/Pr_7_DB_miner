import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pr_7_db_miner/view/detailscreen.dart';

import '../Controller/controller.dart';

class HomeScreen extends StatelessWidget {
  final ApiCalling apiCalling = Get.put(ApiCalling());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu, size: 28, color: Colors.brown)),
            title: Text("My Quotes",
                style: TextStyle(
                    color: Colors.brown,
                    fontWeight: FontWeight.w600,
                    fontSize: 25)),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite, size: 28, color: Colors.brown))
            ],
            expandedHeight: 160,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: AssetImage('assets/img/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Obx(
            () => SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: Container(
                      height: 85,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage('assets/img/$index.jpg'),
                            // Updated to use a placeholder image
                            fit: BoxFit.cover),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(DetailScreen());
                        },
                        child: ListTile(
                          title: Text(
                            apiCalling.quoteData[index].quote.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                            ),
                          ),
                          subtitle: Text(
                            apiCalling.quoteData[index].author.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete, color: Colors.white),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ),
                  );
                },
                childCount: apiCalling.quoteData.length,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
