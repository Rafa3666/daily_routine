import 'package:daily_routine/app/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/filter_pending_controller.dart';

class FilterPendingView extends GetView<FilterPendingController> {
  const FilterPendingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending Tasks'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Obx(() {
        if (controller.labor.where((item) => !item.isCompleted).isEmpty) {
          return Center(
            child: Text("No pending tasks to display"),
          );
        }
        return ListView.builder(
            itemCount:
                controller.labor.where((item) => !item.isCompleted).length,
            itemBuilder: (context, index) {
              final laborItem = controller.labor
                  .where((item) => !item.isCompleted)
                  .toList()[index];

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            controller.deleteLaborItem(laborItem.id);
                          },
                          child: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            });
      }),
      drawer: DrawerWidget(),
    );
  }
}
