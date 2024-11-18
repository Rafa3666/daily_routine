import 'package:daily_routine/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              Get.offAllNamed(Routes.FILTER);
            },
          ),
          const Divider(
            height: 5,
          ),
          ListTile(
            leading: const Icon(Icons.pending),
            title: Text("Pending"),
            onTap: () {
              Get.offAllNamed(Routes.FILTER_PENDING);
            },
          ),
          const Divider(
            height: 5,
          ),
        ],
      ),
    );
  }
}
