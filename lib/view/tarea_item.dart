import 'package:flutter/material.dart';
import '../model/tarea.dart';
import 'detail_view.dart';

class TareaItem extends StatelessWidget {
  final Tarea tarea;
  final VoidCallback onDelete;

  const TareaItem({
    super.key,
    required this.tarea,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(tarea.nombre),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tarea.descripcion),
            const SizedBox(height: 4),
            Text(
              'Fecha: ${tarea.fecha.day}/${tarea.fecha.month}/${tarea.fecha.year}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: onDelete,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailView(tarea: tarea),
            ),
          );
        },
      ),
    );
  }
} 