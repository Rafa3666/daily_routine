import 'package:daily_routine/app/models/checkBox_model.dart';
import 'package:daily_routine/app/widgets/checkBox_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final CheckBoxModel checkBoxItem = CheckBoxModel(text: "Lavar o carro");

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
      body: Column(
        children: [
          Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 25,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CheckboxWidget(
                    item: checkBoxItem,
                  ),
                  Text(
                    checkBoxItem.text,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
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
