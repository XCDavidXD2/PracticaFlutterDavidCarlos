import 'package:flutter/material.dart';
import 'custom_drawer.dart';
import '../model/tarea.dart';
import 'nueva_tarea_modal.dart';

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

  void _mostrarModalNuevaTarea(BuildContext context, Estado estado) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => NuevaTareaModal(
        estado: estado,
        tipoVista: tipoActual,
      ),
    );
  }

  Estado _obtenerEstadoActual(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return Estado.porHacer;
      case 1:
        return Estado.haciendo;
      case 2:
        return Estado.hechos;
      default:
        return Estado.porHacer;
    }
  }

  @override
  Widget build(BuildContext context) {
    final tabIndex = DefaultTabController.of(context).index;
    
    return Scaffold(
      drawer: CustomDrawer(
        tipoActual: tipoActual,
        onTipoChanged: onTipoChanged,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _mostrarModalNuevaTarea(
          context,
          _obtenerEstadoActual(tabIndex),
        ),
        child: const Icon(Icons.add),
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