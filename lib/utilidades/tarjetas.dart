import 'package:flutter/material.dart';

final String url = 'https://picsum.photos/id/';

class Tarjetas {
  final String nombre;
  final String descripcion;
  final Color color;
  final String asset;

  Tarjetas(this.nombre, this.descripcion, this.color, this.asset);
}

final List<Tarjetas> tarjetas = [
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
