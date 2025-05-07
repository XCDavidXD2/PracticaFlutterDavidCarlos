import 'package:flutter/material.dart';
import 'package:practica_flutter_david_carlos/views/tab_bar_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MyTabBarView();
  }
}
