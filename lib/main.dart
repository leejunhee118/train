import 'package:flutter/material.dart';
import 'home_page.dart'; // HomePage를 import합니다.

void main() {
  runApp(FlutterTrainApp());
}

class FlutterTrainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Train App',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: HomePage(), // HomePage가 첫 화면으로 표시됩니다.
    );
  }
}
