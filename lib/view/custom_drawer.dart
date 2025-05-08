import 'package:flutter/material.dart';

enum TipoVista { clase, trabajo, personal }

class CustomDrawer extends StatelessWidget {
  final TipoVista tipoActual;
  final Function(TipoVista) onTipoChanged;

  const CustomDrawer({
    super.key, 
    required this.tipoActual,
    required this.onTipoChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Selecciona una vista'),
          ),
          ListTile(
            title: const Text('Clase'),
            selected: tipoActual == TipoVista.clase,
            onTap: () {
              onTipoChanged(TipoVista.clase);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Trabajo'),
            selected: tipoActual == TipoVista.trabajo,
            onTap: () {
              onTipoChanged(TipoVista.trabajo);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Personal'),
            selected: tipoActual == TipoVista.personal,
            onTap: () {
              onTipoChanged(TipoVista.personal);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
