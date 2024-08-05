import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                  onPressed: () {
                    Get.toNamed('/fev');
                  },
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
            () => apiCalling.isLoading.value
                ? SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height -
                          160, // Adjust based on the AppBar height
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                : SliverList(
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
                                  fit: BoxFit.cover),
                            ),
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
                              trailing: SizedBox(
                                width: 10,
                              ),
                              onTap: () {
                                apiCalling.onChangeIndex(index);
                                Get.toNamed('/detail');
                              },
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
