import 'package:flutter/material.dart';
import 'custom_drawer.dart';

class TabContent extends StatelessWidget {
  final String title;
  final TipoVista tipoActual;
  final Function(TipoVista) onTipoChanged;

  const TabContent({
    super.key,
    required this.title,
    required this.tipoActual,
    required this.onTipoChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
        tipoActual: tipoActual,
        onTipoChanged: onTipoChanged,
      ),
      body: Builder(
        builder: (context) => Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(title),
              ),
            ),
          ],
        ),
      ),
    );
  }
}