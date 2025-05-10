import 'package:flutter/material.dart';
import 'custom_drawer.dart';
import '../model/tarea.dart';
import 'nueva_tarea_modal.dart';
import 'tarea_item.dart';
import '../viewmodel/tarea_view_model.dart';
import 'package:provider/provider.dart';

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

  Tipo _convertirTipoVistaATipo(TipoVista tipoVista) {
    switch (tipoVista) {
      case TipoVista.clase:
        return Tipo.clase;
      case TipoVista.trabajo:
        return Tipo.trabajo;
      case TipoVista.personal:
        return Tipo.personal;
    }
  }

  @override
  Widget build(BuildContext context) {
    final tabIndex = DefaultTabController.of(context).index;
    final estado = _obtenerEstadoActual(tabIndex);
    final tipo = _convertirTipoVistaATipo(tipoActual);
    
    return Scaffold(
      drawer: CustomDrawer(
        tipoActual: tipoActual,
        onTipoChanged: onTipoChanged,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _mostrarModalNuevaTarea(context, estado),
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
              child: Consumer<TareaViewModel>(
                builder: (context, viewModel, child) {
                  final tareas = viewModel.obtenerTareasPorEstadoYTipo(estado, tipo);
                  
                  if (tareas.isEmpty) {
                    return const Center(
                      child: Text('No hay tareas en esta sección'),
                    );
                  }

                  return ListView.builder(
                    itemCount: tareas.length,
                    itemBuilder: (context, index) {
                      final tarea = tareas[index];
                      return TareaItem(
                        tarea: tarea,
                        onDelete: () => viewModel.eliminarTarea(tarea),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}