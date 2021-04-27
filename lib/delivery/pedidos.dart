import 'package:flutter/material.dart';

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
            child: IndexedStack(children: [
              Text('data $selectindex'),
            ]),
          ),
          BarraIndex(index: (x) {
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

  const BarraIndex({Key key, this.index}) : super(key: key);

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
                    color: Colors.white,
                  ),
                  onPressed: () {
                    return index(0);
                  }),
            ),
            Material(
              color: Colors.grey,
              child: IconButton(
                  icon: Icon(Icons.store, color: Colors.white),
                  onPressed: () {
                    return index(1);
                  }),
            ),
            CircleAvatar(
              backgroundColor: Colors.deepPurple,
              child: IconButton(
                  icon: Icon(Icons.shopping_basket, color: Colors.white),
                  onPressed: () {
                    return index(2);
                  }),
            ),
            Material(
              color: Colors.grey,
              child: IconButton(
                  icon: Icon(Icons.favorite_border, color: Colors.white),
                  onPressed: () {
                    return index(3);
                  }),
            ),
            Material(
              color: Colors.grey,
              child: IconButton(
                  icon: Icon(Icons.people_outline, color: Colors.white),
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
