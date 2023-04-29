import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TeacherHomePage extends StatelessWidget {
  const TeacherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Center(child: Text("data")),
          TextButton(
            onPressed: () {
              var a = Hive.box('token');
              print(a.get('myToken'));
            },
            child: const Text("bakalim netmis"),
          ),
          TextButton(
            onPressed: () {
              var a = Hive.box('login');
              print(a.get('isLogined'));
            },
            child: const Text("bakalim netmis"),
          ),
          TextButton(
            onPressed: () {
              var a = Hive.box('role');
              print(a.get('myRole'));
            },
            child: const Text("bakalim netmis"),
          ),
        ],
      ),
    );
  }
}
