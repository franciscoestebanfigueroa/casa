import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:wapp/utilidades/tarjetas.dart';
import 'package:wapp/utilidades/temas.dart';

const _maximo = 300.0;
const _minimo = 100.0;

class Challeng extends StatefulWidget {
  @override
  _ChallengState createState() => _ChallengState();
}

class _ChallengState extends State<Challeng>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  double alturaactual = _minimo;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget mini() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.image),
          GestureDetector(
              onTap: () {
                setState(() {
                  estado = true;
                  alturaactual = _maximo;
                  _animationController.forward(from: 0.0);
                });
              },
              child: Icon(Icons.image_search)),
          Icon(Icons.imagesearch_roller)
        ],
      ),
      width: 100,
      height: 80,
      decoration: BoxDecoration(
          color: Colors.amberAccent, borderRadius: BorderRadius.circular(10)),
    );
  }

  Widget expandido() {
    return Opacity(
      opacity: _animationController.value,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Fotos',
                style: TextStyle(
                  fontSize: (25 * _animationController.value),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ListWheelScrollView(
              squeeze: 0.8,
              magnification: 2.0,
              useMagnifier: true,
              diameterRatio: 2,
              itemExtent: 40,
              children: [
                for (var item in milista)
                  Center(
                    child: Image.network(
                      '${item.asset}/100',
                      fit: BoxFit.cover,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool estado = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      extendBody: true,
      bottomNavigationBar: GestureDetector(
        onVerticalDragUpdate: estado
            ? (x) {
                setState(() {
                  print('x ${x.delta.dy}');
                  final double enmovimiento = alturaactual - x.delta.dy;
                  _animationController.value = enmovimiento / _maximo;
                  alturaactual = enmovimiento.clamp(_minimo, _maximo);
                });
              }
            : null,
        onVerticalDragEnd: estado
            ? (x) {
                if (alturaactual < _maximo / 2) {
                  _animationController.reverse();
                  estado = false;
                } else {
                  _animationController.forward(from: alturaactual / _maximo);
                  estado = true;
                  alturaactual = _maximo;
                }
                // estado = false;
              }
            : null,
        child: Stack(
          children: [
            AnimatedBuilder(
              builder: (contex, child) {
                return Positioned(
                  left: lerpDouble(
                      size.width / 2 - ((size.width * .3) / 2),
                      size.width / 2 - ((size.width * .8) / 2),
                      _animationController.value),
                  width: lerpDouble(size.width * .3, size.width * .8,
                      _animationController.value),
                  height: lerpDouble(100, 300, _animationController.value),
                  bottom: 10,
                  child: Container(
                      decoration: BoxDecoration(
                          gradient: migradiente,
                          color: Colors.pink[600],
                          borderRadius: BorderRadius.circular(
                              lerpDouble(20, 40, _animationController.value))),
                      child: estado ? expandido() : mini()),
                );
              },
              animation: _animationController,
            ),
            /* Positioned(
              left: size.width / 2 - ((size.width * .3) / 2),
              width: size.width * .30,
              height: minimo,
              bottom: 10,
              child: mini,
            ),*/
          ],
        ),
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
