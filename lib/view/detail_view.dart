import 'package:flutter/material.dart';
import '../model/tarea.dart';
import '../viewmodel/tarea_view_model.dart';
import 'package:provider/provider.dart';

class DetailView extends StatelessWidget {
  final Tarea tarea;

  const DetailView({
    super.key,
    required this.tarea,
  });

  String _getEstadoText(Estado estado) {
    switch (estado) {
      case Estado.porHacer:
        return 'Por Hacer';
      case Estado.haciendo:
        return 'Haciendo';
      case Estado.hechos:
        return 'Hecho';
    }
  }

  String _getTipoText(Tipo tipo) {
    switch (tipo) {
      case Tipo.clase:
        return 'Clase';
      case Tipo.trabajo:
        return 'Trabajo';
      case Tipo.personal:
        return 'Personal';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tarea.nombre),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              final viewModel = Provider.of<TareaViewModel>(context, listen: false);
              viewModel.eliminarTarea(tarea);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Descripción',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(tarea.descripcion),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detalles',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    ListTile(
                      leading: const Icon(Icons.calendar_today),
                      title: const Text('Fecha'),
                      subtitle: Text(
                        '${tarea.fecha.day}/${tarea.fecha.month}/${tarea.fecha.year}',
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.flag),
                      title: const Text('Estado'),
                      subtitle: Text(_getEstadoText(tarea.estado)),
                    ),
                    ListTile(
                      leading: const Icon(Icons.category),
                      title: const Text('Tipo'),
                      subtitle: Text(_getTipoText(tarea.tipo)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
