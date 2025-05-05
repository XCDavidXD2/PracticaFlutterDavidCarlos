import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.settings)),
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.person))
              ],
            ),
            title: const Text('TabBar Example'),

          ),
          body: const TabBarView(
            children: [
              Center(child: Text('Settings')),
              Center(child: Text('Home')),
              Center(child: Text('Profile')),
            ],
          ),
        )
      ),
    );
  }
}
