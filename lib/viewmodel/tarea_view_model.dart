import 'package:flutter/material.dart';
import 'package:practica_flutter_david_carlos/model/tarea.dart';

class TareaViewModel extends ChangeNotifier {
  final List<Tarea> _tareas = [];

  List<Tarea> get porHacer => _tareas.where((t) => t.estado == Estado.porHacer).toList();
  List<Tarea> get haciendo => _tareas.where((t) => t.estado == Estado.haciendo).toList();
  List<Tarea> get hechas => _tareas.where((t) => t.estado == Estado.hechos).toList();

  List<Tarea> obtenerTareasPorEstadoYTipo(Estado estado, Tipo tipo) {
    return _tareas.where((tarea) => 
      tarea.estado == estado && tarea.tipo == tipo
    ).toList();
  }

  List<Tarea> obtenerTareasPorEstado(Estado estado) {
    return _tareas.where((tarea) => tarea.estado == estado).toList();
  }

  List<Tarea> obtenerTareasPorTipo(Tipo tipo) {
    return _tareas.where((tarea) => tarea.tipo == tipo).toList();
  }

  void agregarTarea(Tarea tarea) {
    _tareas.add(tarea);
    notifyListeners();
  }

  void cambiarEstadoTarea(Tarea tarea, Estado nuevoEstado) {
    final index = _tareas.indexOf(tarea);
    if (index != -1) {
      _tareas[index].estado = nuevoEstado;
      notifyListeners();
    }
  }

  void cambiarTipoTarea(Tarea tarea, Tipo nuevoTipo) {
    final index = _tareas.indexOf(tarea);
    if (index != -1) {
      _tareas[index].tipo = nuevoTipo;
      notifyListeners();
    }
  }

  void eliminarTarea(Tarea tarea) {
    _tareas.remove(tarea);
    notifyListeners();
  }
}