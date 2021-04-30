import 'package:flutter/material.dart';
import 'package:wapp/delivery/widget_boton.dart';
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
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: CardCarrito(),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Total de productos ',
                              style: TextStyle(fontSize: 35),
                            ),
                            Text(
                              'Son Pesos \$',
                              style: TextStyle(fontSize: 25),
                            ),
                            Spacer(),
                            Divider(),
                            Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: BotonGenerico(
                                nombre: 'Pagar',
                                fontsize: 20,
                                ontap: () {},
                              ),
                            )
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                )
              ],
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

class CardCarrito extends StatelessWidget {
  const CardCarrito({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tarjetas.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          children: [
            Column(
              children: [
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ClipOval(
                          child: Image.network(
                            '${tarjetas[index].asset}$index/100',
                            errorBuilder: (context, _, x) {
                              print(x);
                              return Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                    'No se pudo cargar \nla imagen..\n verifique la conexión',
                                    textAlign: TextAlign.center),
                              ));
                            },
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  icon: Icon(Icons.add_circle),
                                  onPressed: () {}),
                              Text('3'),
                              IconButton(
                                  icon: Icon(Icons.remove_circle),
                                  onPressed: () {}),
                            ],
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Column(
                            children: [
                              Text(tarjetas[index].nombre),
                              Text(tarjetas[index].descripcion),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: 0,
              child: CircleAvatar(
                child: IconButton(
                    icon: Icon(Icons.restore_from_trash_sharp),
                    onPressed: () {}),
              ),
            ),
          ],
        );
      },
    );
  }
}
