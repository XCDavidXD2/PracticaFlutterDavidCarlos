import 'package:flutter/material.dart';

enum Estado {
  porHacer,
  haciendo,
  hechos,
}

enum Tipo {
  clase,
  trabajo,
  personal,
}

class Tarea {
  String nombre;
  String descripcion;
  DateTime fecha;
  Estado estado;
  Tipo tipo;

  Tarea({
    required this.nombre,
    required this.descripcion,
    required this.fecha,
    required this.estado,
    required this.tipo,
  });
}