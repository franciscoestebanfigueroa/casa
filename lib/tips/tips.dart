import 'package:flutter/material.dart';
import 'package:wapp/utilidades/tarjetas.dart';
import 'package:wapp/utilidades/temas.dart';

class Tips extends StatelessWidget {
  const Tips({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DecoratedBox(
        decoration: BoxDecoration(gradient: migradiente),
        child: ListView.builder(
          // scrollDirection: Axis.horizontal,
          itemCount: tarjetas.length,
          itemBuilder: (BuildContext context, int index) {
            return Align(
              widthFactor: 0.7, //factor de ancho, superpone
              heightFactor: 0.7,
              child: ClipOval(
                child: Image.network(
                  '${tarjetas[index].asset}/$index/300/300',
                  fit: BoxFit.cover,
                  width: 300,
                  height: 300,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
