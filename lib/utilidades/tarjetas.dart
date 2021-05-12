import 'package:flutter/material.dart';

final String url = 'https://picsum.photos/id/';

class Tarjetas {
  final String nombre;
  final String descripcion;
  final Color color;
  final String asset;

  Tarjetas(this.nombre, this.descripcion, this.color, this.asset);
}

final tarjetas = [
  Tarjetas('Carolina', 'Madre', Colors.deepPurpleAccent, url),
  Tarjetas('Lara', 'Hija', Colors.pink, url),
  Tarjetas('Estaban', 'Hijo', Colors.orange, url),
  Tarjetas('Francisco', 'Padre', Colors.blue, url),
  Tarjetas('Carolina', 'Madre', Colors.deepPurpleAccent, url),
  Tarjetas('Lara', 'Hija', Colors.pink, url),
  Tarjetas('Estaban', 'Hijo', Colors.orange, url),
  Tarjetas('Francisco', 'Padre', Colors.blue, url),
  Tarjetas('Carolina', 'Madre', Colors.deepPurpleAccent, url),
  Tarjetas('Lara', 'Hija', Colors.pink, url),
  Tarjetas('Estaban', 'Hijo', Colors.orange, url),
  Tarjetas('Francisco', 'Padre', Colors.blue, url),
  Tarjetas('Carolina', 'Madre', Colors.deepPurpleAccent, url),
  Tarjetas('Lara', 'Hija', Colors.pink, url),
  Tarjetas('Estaban', 'Hijo', Colors.orange, url),
  Tarjetas('Francisco', 'Padre', Colors.blue, url),
];

final List<Color> colorindex = [
  Colors.black,
  Colors.orange,
  Colors.blue,
  Colors.pink,
  Colors.white
];
Tarjetas temptarjetas;
List<Tarjetas> milista = [
  Tarjetas('PRIMERO', 'uno', Colors.red, '${tarjetas[0].asset}/10/300'),
  Tarjetas('SEGUNDO', 'dos', Colors.orange, '${tarjetas[0].asset}/12/300'),
  Tarjetas('TERCERO', 'tres', Colors.green, '${tarjetas[0].asset}/16/300'),
  Tarjetas('CUARTO', 'cuatro', Colors.blue, '${tarjetas[0].asset}/290/300'),
  Tarjetas('QUINTO', 'cinco', Colors.yellow, '${tarjetas[0].asset}/11/300'),
  Tarjetas('SEXTO', 'seis', Colors.pink, '${tarjetas[0].asset}/19/300'),
  Tarjetas('PRIMERO', 'uno', Colors.red, '${tarjetas[0].asset}/102/300'),
  Tarjetas('SEGUNDO', 'dos', Colors.orange, '${tarjetas[0].asset}/122/300'),
  Tarjetas('TERCERO', 'tres', Colors.green, '${tarjetas[0].asset}/126/300'),
  Tarjetas('CUARTO', 'cuatro', Colors.blue, '${tarjetas[0].asset}/293/300'),
  Tarjetas('QUINTO', 'cinco', Colors.yellow, '${tarjetas[0].asset}/121/300'),
  Tarjetas('SEXTO', 'seis', Colors.pink, '${tarjetas[0].asset}/193/300'),
];
