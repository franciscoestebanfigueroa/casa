import 'package:flutter/material.dart';
import 'package:wapp/utilidades/temas.dart';

class Boton_generico extends StatelessWidget {
  final VoidCallback ontap;
  final String nombre;
  final double fontsize;

  const Boton_generico(
      {Key key, this.ontap, this.nombre = 'seleccion', this.fontsize = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: coloresgradiente,
          stops: [0.3, 0.8],
        ),
      ),
      child: TextButton(
        onPressed: ontap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            nombre,
            style: TextStyle(
                color: Colors.white,
                fontSize: fontsize,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
