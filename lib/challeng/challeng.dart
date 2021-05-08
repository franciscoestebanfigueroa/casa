import 'package:flutter/material.dart';
import 'package:wapp/animatedcontainer/containeranimed.dart';
import 'package:wapp/usosliver/usosliver.dart';
import 'package:wapp/utilidades/tarjetas.dart';

ScrollController _scrollcontroler, _scrollmenu;

class Challeng extends StatefulWidget {
  @override
  _ChallengState createState() => _ChallengState();
}

class _ChallengState extends State<Challeng> {
  void indice() {
    setState(() {});
  }

  @override
  void initState() {
    _scrollcontroler = ScrollController(debugLabel: 'fotos');
    _scrollcontroler.addListener(() {
      //   print(_scrollcontroler);
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollcontroler.removeListener(() {
      indice();
    });
    _scrollcontroler.dispose();
    super.dispose();
  }

  Tarjetas temptarjetas;
  List<Tarjetas> milista = [
    Tarjetas('PRIMERO', 'uno', Colors.red, '${tarjetas[0].asset}/10/300'),
    Tarjetas('SEGUNDO', 'dos', Colors.orange, '${tarjetas[0].asset}/12/300'),
    Tarjetas('TERCERO', 'tres', Colors.green, '${tarjetas[0].asset}/16/300'),
    Tarjetas('CUARTO', 'cuatro', Colors.blue, '${tarjetas[0].asset}/290/300'),
    Tarjetas('QUINTO', 'cinco', Colors.yellow, '${tarjetas[0].asset}/11/300'),
    Tarjetas('SEXTO', 'seis', Colors.pink, '${tarjetas[0].asset}/19/300'),
    Tarjetas('PRIMERO', 'uno', Colors.red, '${tarjetas[0].asset}/102/300'),
    Tarjetas('SEGUNDO', 'dos', Colors.orange, '${tarjetas[0].asset}/122/300'),
    Tarjetas('TERCERO', 'tres', Colors.green, '${tarjetas[0].asset}/126/300'),
    Tarjetas('CUARTO', 'cuatro', Colors.blue, '${tarjetas[0].asset}/293/300'),
    Tarjetas('QUINTO', 'cinco', Colors.yellow, '${tarjetas[0].asset}/121/300'),
    Tarjetas('SEXTO', 'seis', Colors.pink, '${tarjetas[0].asset}/193/300')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: ReorderableListView(
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              temptarjetas = milista[oldIndex];
              milista[oldIndex] = milista[newIndex - 1];
              milista[newIndex - 1] = temptarjetas;
            }
            if (oldIndex > newIndex) {
              temptarjetas = milista[oldIndex];
              milista[oldIndex] = milista[newIndex];
              milista[newIndex] = temptarjetas;
            }
          });
        },
        children: [
          for (final xxx in milista)
            ListTile(
              tileColor: xxx.color,
              key: ValueKey(xxx),
              subtitle: Text('${xxx.nombre}'),
              title: Image.network(xxx.asset),
            ),
        ],
      ),
    );
  }
}

class Menu extends StatefulWidget {
  final double height;
  const Menu({Key key, this.height}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  Animation _animation;
  Offset movimiento = Offset.zero;
  double dy = 100;
  @override
  void initState() {
    _scrollmenu = ScrollController(debugLabel: 'menu');
    _scrollmenu.addListener(() {
      print(_scrollmenu);
    });
    _animationController =
        AnimationController(duration: Duration(milliseconds: 900), vsync: this);
    _animation = Tween(begin: 1, end: 0).animate(_animationController);
    _animationController.forward();

    print(_animationController.value);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();

    _scrollcontroler.removeListener(() {});
    _scrollmenu.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //  final scroller = _scrollcontroler.offset;

    return Positioned(
      bottom: 0,
      left: (size.width / 2) - (dy / 2),
      child: GestureDetector(
        onTap: () {
          setState(() {
            movimiento = Offset.zero;
            dy = 400;
          });
        },
        onPanUpdate: (c) {
          //  movimiento += (c.delta) - Offset(0.0, c.delta.dy - dy);

          movimiento += (c.delta);

          dy = 100 - (movimiento.dy);

          if (dy < 100) movimiento = Offset.zero;
          if (dy > 200) {
            dy = 200;
          }
          ;

          setState(() {
            print('dy--->$dy');
            print('ofset ${movimiento * (.1)}');
            print('delta ${c.delta.dy * (1)}');
          });
        },
        child: AnimatedBuilder(
          animation: _animationController.view,
          builder: (BuildContext context, Widget child) {
            return Container(color: Colors.red, width: dy, height: dy);
          },
        ),
      ),
    );
  }
}
