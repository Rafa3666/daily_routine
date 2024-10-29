import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Routine'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            AppBar(
              title: Text("List Filter"),
              automaticallyImplyLeading: false,
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
            ),
            ListTile(
              leading: const Icon(Icons.check),
              title: Text("Completed"),
              onTap: () {},
            ),
            const Divider(
              height: 5,
            ),
            ListTile(
              leading: const Icon(Icons.pending),
              title: Text("Pending"),
              onTap: () {},
            ),
            const Divider(
              height: 5,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        onPressed: () {},
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
