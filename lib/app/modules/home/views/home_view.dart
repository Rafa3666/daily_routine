import 'package:daily_routine/app/models/checkBox_model.dart';
import 'package:daily_routine/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final CheckBoxModel checkBoxItem = CheckBoxModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Daily Routine'),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (query) {
                  controller.searchQuery.value = query;
                },
                decoration: InputDecoration(
                  labelText: 'Search tasks',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: Obx(() {
                final filteredLabor = controller.labor
                    .where((laborItem) => laborItem.title
                        .toLowerCase()
                        .contains(controller.searchQuery.value.toLowerCase()))
                    .toList();

                if (controller.labor.isEmpty) {
                  return Center(
                    child: Text("No tasks to display"),
                  );
                }
                return ListView.builder(
                    itemCount: filteredLabor.length,
                    itemBuilder: (context, index) {
                      final laborItem = filteredLabor[index];

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
                                  controller.changeCheckBoxValue(
                                      value, laborItem);
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
                                    editTaskModel(
                                        context, controller, laborItem);
                                  },
                                  child: Icon(Icons.edit),
                                ),
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
                leading: const Icon(Icons.home_filled),
                title: Text("Home"),
                onTap: () {
                  Get.offAllNamed(Routes.HOME);
                },
              ),
              const Divider(
                height: 5,
              ),
              ListTile(
                leading: const Icon(Icons.check),
                title: Text("Completed"),
                onTap: () {
                  Get.toNamed(Routes.FILTER);
                },
              ),
              const Divider(
                height: 5,
              ),
              ListTile(
                leading: const Icon(Icons.pending),
                title: Text("Pending"),
                onTap: () {
                  Get.toNamed(Routes.FILTER_PENDING);
                },
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

addTaskModel(context, controller) {
  return showModalBottomSheet(
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SizedBox(height: 15),
              SizedBox(
                width: 350,
                height: 50,
                child: TextField(
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    controller.title.value = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "- Enter the title of your task *",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 350,
                height: 50,
                child: TextField(
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    controller.subtitle.value = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: "- Enter the subtitle of your task",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 350,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    controller.saveTask();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.deepPurple)),
                  child: Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

editTaskModel(context, controller, laborItem) {
  controller.newTitle.value = laborItem.title;
  controller.newSubtitle.value = laborItem.subtitle;
  return showModalBottomSheet(
    context: context,
    builder: (context) => Scaffold(
      appBar: AppBar(
        toolbarHeight: 45,
        automaticallyImplyLeading: false,
        title: Text("Update Task"),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SizedBox(height: 15),
              SizedBox(
                width: 350,
                height: 50,
                child: TextField(
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    controller.newTitle.value = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: laborItem.title,
                  ),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 350,
                height: 50,
                child: TextField(
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    controller.newSubtitle.value = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: laborItem.subtitle,
                  ),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 350,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    controller.updateLaborItem(
                      laborItem.id,
                      controller.newTitle,
                      controller.newSubtitle,
                      laborItem.isCompleted,
                    );
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.deepPurple)),
                  child: Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
