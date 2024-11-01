import 'package:daily_routine/app/models/checkBox_model.dart';
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
              vertical: 10,
            ),
            child: Column(
              children: <Widget>[
                Obx(() {
                  return ListTile(
                    leading: Checkbox(
                      value: controller.checkBoxValue.value,
                      onChanged: (bool? value) {
                        controller.changeCheckBoxValue(value);
                      },
                    ),
                    title: Text(
                      "Lavar o carro",
                      style: TextStyle(
                        decoration: controller.checkBoxValue.value
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    subtitle: Text(
                      "Limpeza geral no celta",
                      style: TextStyle(
                        decoration: controller.checkBoxValue.value
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                  );
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {},
                      child: Icon(Icons.edit),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Icon(Icons.delete),
                    ),
                  ],
                )
              ],
            ),
          ),
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
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Scaffold(
              appBar: AppBar(
                toolbarHeight: 45,
                automaticallyImplyLeading: false,
                title: Text("Add a new task"),
                centerTitle: true,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0,
                    color: Colors.black,
                  ),
                ),
              ),
              body: Column(
                children: <Widget>[
                  Center(
                    child: SizedBox(
                      width: 350,
                      height: 50,
                      child: TextField(
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintText: " - Digite o título de sua tarefa",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
