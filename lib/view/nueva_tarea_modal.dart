import 'package:flutter/material.dart';
import '../model/tarea.dart';
import 'custom_drawer.dart';
import '../viewmodel/tarea_view_model.dart';
import 'package:provider/provider.dart';

class NuevaTareaModal extends StatelessWidget {
  final Estado estado;
  final TipoVista tipoVista;

  const NuevaTareaModal({
    super.key,
    required this.estado,
    required this.tipoVista,
  });

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
    final TextEditingController nombreController = TextEditingController();
    final TextEditingController descripcionController = TextEditingController();
    final viewModel = Provider.of<TareaViewModel>(context, listen: false);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nombreController,
            decoration: const InputDecoration(
              labelText: 'Nombre de la tarea',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: descripcionController,
            decoration: const InputDecoration(
              labelText: 'Descripción',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (nombreController.text.isNotEmpty) {
                final nuevaTarea = Tarea(
                  nombre: nombreController.text,
                  descripcion: descripcionController.text,
                  fecha: DateTime.now(),
                  estado: estado,
                  tipo: _convertirTipoVistaATipo(tipoVista),
                );
                viewModel.agregarTarea(nuevaTarea);
                Navigator.pop(context);
              }
            },
            child: const Text('Guardar'),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
} 