import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../controllers/filter_controller.dart';

class FilterView extends GetView<FilterController> {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Completed Tasks'),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        body: Obx(() {
          if (controller.labor.where((item) => item.isCompleted).isEmpty) {
            return Center(
              child: Text("No completed tasks to display"),
            );
          }
          return ListView.builder(
              itemCount:
                  controller.labor.where((item) => item.isCompleted).length,
              itemBuilder: (context, index) {
                final completedLaborItems =
                    controller.labor.where((item) => item.isCompleted).toList();
                final laborItem = completedLaborItems[index];

                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Checkbox(
                          value: laborItem.isCompleted,
                          onChanged: (bool? value) {
                            controller.changeCheckBoxValue(value, laborItem);
                          },
                        ),
                        title: Text(
                          laborItem.title,
                          style: TextStyle(
                            decoration: laborItem.isCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        subtitle: Text(
                          laborItem.subtitle,
                          style: TextStyle(
                            decoration: laborItem.isCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
        }),
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
                leading: const Icon(Icons.home_filled),
                title: Text("Home"),
                onTap: () {
                  Get.offAllNamed("/home");
                },
              ),
              const Divider(
                height: 5,
              ),
              ListTile(
                leading: const Icon(Icons.check),
                title: Text("Completed"),
                onTap: () {
                  Get.toNamed("/filter");
                },
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
          onPressed: () {
            addTaskModel(context, controller);
          },
          backgroundColor: Colors.deepPurple,
          child: const Icon(
            Icons.add,
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniEndFloat);
  }
}
