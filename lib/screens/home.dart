import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:async';

import 'package:hive/hive.dart';
import 'package:requiz/screens/flashcard.dart';
import 'package:requiz/screens/quiz.dart';
import 'package:requiz/screens/settings.dart';

import '../utils/local_storage_service.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  doNothing() {}

  const HomeScreen({Key? key}) : super(key: key);

  // const HomeScreen({Key? key}) : super(key: key)

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//RETURNS A FLUTTER CHART INSTANCE

class _HomeScreenState extends State<HomeScreen> {
  late Box userBox;

  initState() {
    super.initState();
    createOpenBox();
  }

  void createOpenBox() async {
    userBox = await LocalStorageService.openBox('userBox');
  }

  List screens = [
    const QuizScreen(),
    const FlashcardScreen(),
    const SettingsScreen()
  ];

  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget loggedIn() {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          selectedItemColor: Colors.green,
          selectedFontSize: 13,
          unselectedFontSize: 13,
          iconSize: 20,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: 'Quiz',
            ),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.bar_chart_rounded), label: 'Love Tank'),
            BottomNavigationBarItem(
              icon: Icon(Icons.bolt),
              label: 'Flashcards',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
        body: screens[selectedIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return loggedIn();
  }
}
