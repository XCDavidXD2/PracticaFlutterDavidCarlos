import 'package:flutter/material.dart';

class MyTabBarView extends StatelessWidget {
  const MyTabBarView({super.key});

 
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
              Center(child: Text('Hechas')),
              Center(child: Text('Haciendo')),
              Center(child: Text('Por Hacer')),
            ],
          ),
        )
      ),
    );
  }
}