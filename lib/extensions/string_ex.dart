import 'package:flutter/material.dart';

extension StringEx on String {
  Color toColor() {
    try {
      // Divide la cadena en partes y verifica que sean exactamente tres
      List<String> colorListString = split(',').map((e) => e.trim()).toList();
      if (colorListString.length != 3) {
        throw FormatException(
            "El string debe contener exactamente tres valores separados por comas.");
      }

      // Intenta convertir los valores a enteros
      int r = int.parse(colorListString[0]);
      int g = int.parse(colorListString[1]);
      int b = int.parse(colorListString[2]);

      // Retorna el color
      return Color.fromRGBO(r, g, b, 1);
    } catch (e) {
      // Manejo de errores: devuelve un color predeterminado o lanza una excepción
      debugPrint("Error al convertir el string a color: $e");
      return Colors.black; // Cambia este valor según sea necesario
    }
  }
}
