import 'package:flutter/material.dart';

class FlashcardScreen extends StatefulWidget {
  static String id = "Flashcard_screen";
  const FlashcardScreen({Key? key}) : super(key: key);

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  dynamic _flashcard;
  @override
  void initState() {
    super.initState();
    _loadStoredFlashcard();
  }

  void doNothing() {}

  _loadStoredFlashcard() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Flashcard')),
        body: Center(
          child: const Text("Flashcard Screen"),
        ));
  }
}
