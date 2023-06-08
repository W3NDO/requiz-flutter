import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../utils/local_storage_service.dart';

class SettingsScreen extends StatefulWidget {
  static String id = "settings_screen";
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Box userBox;

  initState() {
    super.initState();
    createOpenBox();
  }

  void createOpenBox() async {
    userBox = await LocalStorageService.openBox('userBox');
  }

  void doNothing() {}

  void LogOut() {
    userBox.put('isLoggedIn', false);
    userBox.clear();
    userBox.close();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Settings')),
        body: Center(
          child: ElevatedButton(
            child: Text("Log Out"),
            onPressed: (() => LogOut()),
          ),
        ));
  }
}
