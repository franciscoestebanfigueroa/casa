import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wapp/delivery/widget_boton.dart';
import 'package:wapp/utilidades/tarjetas.dart';

class Productos extends StatelessWidget {
  const Productos({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: tarjetas.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //crossAxisSpacing: 20,
          //mainAxisSpacing: 20,
          maxCrossAxisExtent: MediaQuery.of(context).size.width / 2),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            elevation: 3,
            child: Column(children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipOval(
                    child: Image.network(
                      '${tarjetas[index].asset}$index/50',
                      loadingBuilder: (context, _, ImageChunkEvent x) {
                        if (x != null)
                          return Center(child: CircularProgressIndicator());
                        return Image.network(
                            '${tarjetas[index].asset}$index/300');
                      },
                    ),
                  ),
                ),
              ),
              Text('${tarjetas[index].nombre}'),
              Text('${tarjetas[index].descripcion}'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Boton_generico(
                  nombre: 'Seleccionar',
                  ontap: () {},
                ),
              )
            ]),
          ),
        );
      },
    );
  }
}
