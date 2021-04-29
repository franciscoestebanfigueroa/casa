import 'package:flutter/material.dart';
import 'package:wapp/utilidades/tarjetas.dart';
import 'package:wapp/utilidades/temas.dart';

class Carrito extends StatelessWidget {
  const Carrito({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(gradient: migradiente),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: tarjetas.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ClipOval(
                                child: Image.network(
                                    '${tarjetas[index].asset}$index/100'),
                              ),
                            ),
                            Text(tarjetas[index].nombre),
                            Text(tarjetas[index].descripcion)
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          flex: 2,
        ),
        Expanded(
          flex: 1,
          child: Container(color: Colors.red),
        )
      ],
    );
  }
}
