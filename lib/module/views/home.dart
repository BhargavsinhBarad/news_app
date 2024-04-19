import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/module/views/country.dart';
import 'package:news_app/module/views/topic.dart';

class home extends StatefulWidget {
  home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
            },
            icon: const Icon(Icons.sunny),
          ),
        ],
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.topic),
              child: Text("Topic"),
            ),
            Tab(
              icon: Icon(Icons.flag),
              child: Text("country"),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          topic(),
          country(),
        ],
      ),
    );
  }
}
