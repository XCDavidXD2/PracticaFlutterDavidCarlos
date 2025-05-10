import 'package:flutter/material.dart';
import 'view/custom_drawer.dart';
import 'view/tab_content.dart';
import 'viewmodel/tarea_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TareaViewModel(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TipoVista _tipoActual = TipoVista.clase;

  String _getTitleForTab(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return 'Por Hacer ${_tipoActual.toString().split('.').last}';
      case 1:
        return 'Haciendo ${_tipoActual.toString().split('.').last}';
      case 2:
        return 'Hechos ${_tipoActual.toString().split('.').last}';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.check_box_outline_blank)),
              Tab(icon: Icon(Icons.waves_sharp)),
              Tab(icon: Icon(Icons.check_box))
            ],
          ),
          title: const Text('TO DO'),
        ),
        body: TabBarView(
          children: [
            TabContent(
              title: _getTitleForTab(0),
              tipoActual: _tipoActual,
              onTipoChanged: (tipo) => setState(() => _tipoActual = tipo),
            ),
            TabContent(
              title: _getTitleForTab(1),
              tipoActual: _tipoActual,
              onTipoChanged: (tipo) => setState(() => _tipoActual = tipo),
            ),
            TabContent(
              title: _getTitleForTab(2),
              tipoActual: _tipoActual,
              onTipoChanged: (tipo) => setState(() => _tipoActual = tipo),
            ),
          ],
        ),
      ),
    );
  }
}
