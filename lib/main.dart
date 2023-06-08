import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:requiz/screens/home.dart';
import 'package:requiz/screens/login.dart';
import 'package:requiz/utils/local_storage_service.dart';

late Box userBox;

void main() async {
  await Hive.initFlutter();
  userBox = await LocalStorageService.openBox('userBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final initialScreenValue = userBox.get('isLoggedIn') ?? false
    //     ? HomeScreen.routeName
    //     : LoginScreen.routeName;

    const initialScreenValue =
        HomeScreen.routeName; // TODO enable login functionality

    return MaterialApp(
      title: 'ReQuiz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: initialScreenValue,
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
      home: const HomeScreen(),
    );
  }
}
