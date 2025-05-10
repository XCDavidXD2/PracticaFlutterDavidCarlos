# Aplicación de Tareas con Navegación en Flutter

Este proyecto es una aplicación de gestión de tareas que implementa diferentes tipos de navegación en Flutter, demostrando el uso de:
- Navegación con Drawer (menú lateral)
- Navegación con Tabs (pestañas)
- Navegación jerárquica (navegación entre pantallas)

## Características

### Navegación con Drawer
- Menú lateral que permite filtrar las tareas por tipo:
  - Clase
  - Trabajo
  - Personal

### Navegación con Tabs
- Tres pestañas que muestran las tareas según su estado:
  - Por Hacer
  - Haciendo
  - Hechos

### Navegación Jerárquica
- Vista de detalle de cada tarea
- Navegación hacia adelante y atrás entre pantallas
- Eliminación de tareas desde la vista de detalle

## Estructura del Proyecto

```
lib/
├── main.dart              # Punto de entrada de la aplicación
├── model/
│   └── tarea.dart         # Modelo de datos para las tareas
├── view/
│   ├── custom_drawer.dart # Implementación del menú lateral
│   ├── tab_content.dart   # Contenido de las pestañas
│   ├── tarea_item.dart    # Widget para mostrar cada tarea
│   ├── detail_view.dart   # Vista de detalle de una tarea
│   └── nueva_tarea_modal.dart # Modal para crear nuevas tareas
└── viewmodel/
    └── tarea_view_model.dart # Lógica de negocio y estado
```

## Tecnologías Utilizadas

- Flutter
- Provider (para la gestión del estado)
- Material Design

## Funcionalidades

1. **Gestión de Tareas**
   - Crear nuevas tareas
   - Ver detalles de las tareas
   - Eliminar tareas
   - Filtrar tareas por tipo y estado

2. **Navegación**
   - Menú lateral para filtrar por tipo
   - Pestañas para filtrar por estado
   - Vista de detalle para cada tarea

## Cómo Ejecutar el Proyecto

1. Asegúrate de tener Flutter instalado
2. Clona el repositorio
3. Ejecuta `flutter pub get` para instalar las dependencias
4. Ejecuta `flutter run` para iniciar la aplicación

## Dependencias

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.1
```

## Objetivos de Aprendizaje

Este proyecto demuestra:
- Implementación de diferentes tipos de navegación en Flutter
- Gestión de estado con Provider
- Diseño de interfaces con Material Design
- Organización de código siguiendo el patrón MVVM
- Implementación de funcionalidades CRUD básicas
