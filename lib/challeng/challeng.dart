import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wapp/animatedcontainer/containeranimed.dart';
import 'package:wapp/usosliver/usosliver.dart';
import 'package:wapp/utilidades/tarjetas.dart';

class Challeng extends StatefulWidget {
  @override
  _ChallengState createState() => _ChallengState();
}

class _ChallengState extends State<Challeng> {
  ScrollController _scrollcontroler;
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
    Tarjetas('SEXTO', 'seis', Colors.pink, '${tarjetas[0].asset}/193/300'),
  ];
  double slidervalue = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Column(
        children: [
          Slider(
              max: 150,
              value: slidervalue,
              onChanged: (value) {
                setState(() {
                  slidervalue = value;
                });
              }),
          Expanded(
            child: Stack(
              children: [
                ReorderableListView(
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
                Menu(
                  height: slidervalue,
                )
              ],
            ),
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
  ScrollController _scrollcontroler;
  AnimationController _animationController;

  Animation _animation;
  Offset movimiento = Offset.zero;
  double dy = 100;
  @override
  void initState() {
    _scrollcontroler = ScrollController(debugLabel: 'menu');
    _scrollcontroler.addListener(() {
      print(_scrollcontroler.position.viewportDimension);
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
    _scrollcontroler.dispose();
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

class Menudos extends StatefulWidget {
  double valueslider;
  Menudos({Key key, this.valueslider}) : super(key: key);

  @override
  _MenudosState createState() => _MenudosState();
}

class _MenudosState extends State<Menudos> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: (MediaQuery.of(context).size.width / 2) -
          (((100) - widget.valueslider)),
      child: Container(
        alignment: Alignment.center,
        width: 300,
        height: 300,
        child: AnimatedPadding(
            child: Container(
              height: 200,
              width: 200,
              color: Colors.red,
            ),
            padding: EdgeInsets.all(widget.valueslider),
            duration: Duration(milliseconds: 900)),
      ),
    );
  }
}
