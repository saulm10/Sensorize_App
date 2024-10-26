import 'package:flutter/material.dart';

extension BuildContextEx on BuildContext {
  // Agregar un getter para el tema
  ThemeData get theme => Theme.of(this);

  // Puedes agregar más extensiones aquí, por ejemplo para texto o colores
  TextTheme get textTheme => Theme.of(this).textTheme;
}
