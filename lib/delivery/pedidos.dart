import 'package:flutter/material.dart';
import 'package:wapp/delivery/caritovacio.dart';
import 'package:wapp/delivery/carrito.dart';
import 'package:wapp/delivery/perfil.dart';
import 'package:wapp/delivery/productos.dart';

class Pedidos extends StatefulWidget {
  @override
  _PedidosState createState() => _PedidosState();
}

class _PedidosState extends State<Pedidos> {
  int selectindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: IndexedStack(index: selectindex, children: [
              Productos(),
              CaritoVacio(
                carrito_vacio: () {
                  setState(() {
                    selectindex = 0;
                  });
                },
              ),
              Carrito(),
              Text('selecciona el widget'),
              Perfil()
            ]),
          ),
          BarraIndex(
              select: selectindex,
              index: (x) {
                setState(() {
                  selectindex = x;
                });
              }),
        ],
      ),
    );
  }
}

class BarraIndex extends StatelessWidget {
  final ValueChanged<int> index;
  final int select;
  const BarraIndex({Key key, this.index, this.select}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Material(
              color: Colors.grey,
              child: IconButton(
                  icon: Icon(
                    Icons.home,
                    color: select == 0 ? Colors.green : Colors.white,
                  ),
                  onPressed: () {
                    return index(0);
                  }),
            ),
            Material(
              color: Colors.grey,
              child: IconButton(
                  icon: Icon(
                    Icons.store,
                    color: select == 1 ? Colors.green : Colors.white,
                  ),
                  onPressed: () {
                    return index(1);
                  }),
            ),
            CircleAvatar(
              backgroundColor: Colors.deepPurple,
              child: IconButton(
                  icon: Icon(
                    Icons.shopping_basket,
                    color: select == 2 ? Colors.green : Colors.white,
                  ),
                  onPressed: () {
                    return index(2);
                  }),
            ),
            Material(
              color: Colors.grey,
              child: IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: select == 3 ? Colors.green : Colors.white,
                  ),
                  onPressed: () {
                    return index(3);
                  }),
            ),
            Material(
              color: Colors.grey,
              child: IconButton(
                  icon: Icon(
                    Icons.people_outline,
                    color: select == 4 ? Colors.green : Colors.white,
                  ),
                  onPressed: () {
                    return index(4);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
