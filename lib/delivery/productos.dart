import 'package:flutter/material.dart';

import 'package:wapp/utilidades/tarjetas.dart';
import 'package:wapp/utilidades/temas.dart';

import 'widget_boton.dart';

class Productos extends StatelessWidget {
  const Productos({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: migradiente),
      child: GridView.builder(
        itemCount: tarjetas.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //crossAxisSpacing: 20,
            //mainAxisSpacing: 20,
            maxCrossAxisExtent: MediaQuery.of(context).size.width / 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 3,
              child: Column(children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipOval(
                      child: Image.network(
                        '${tarjetas[index].asset}$index/50',
                        errorBuilder: (context, _, x) {
                          print(x);
                          return Center(
                              child: Text(
                                  'No se pudo cargar la imagen..\n verifique la conexión',
                                  textAlign: TextAlign.center));
                        },
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
                  child: BotonGenerico(
                    nombre: 'Seleccionar',
                    ontap: () {},
                  ),
                )
              ]),
            ),
          );
        },
      ),
    );
  }
}
