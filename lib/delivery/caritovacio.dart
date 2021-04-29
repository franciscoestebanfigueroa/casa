import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wapp/utilidades/temas.dart';

class CaritoVacio extends StatelessWidget {
  final VoidCallback carrito_vacio;

  const CaritoVacio({Key key, this.carrito_vacio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: migradiente),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Ups Carrito Vacio...',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Material(
                color: Colors.transparent,
                child: TextButton(
                  child: Text(
                    'Ir a Compras',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 30, color: Colors.deepPurpleAccent),
                  ),
                  onPressed: carrito_vacio,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
