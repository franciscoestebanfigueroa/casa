import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:wapp/utilidades/tarjetas.dart';
import 'package:wapp/utilidades/temas.dart';

class Challeng extends StatefulWidget {
  @override
  _ChallengState createState() => _ChallengState();
}

class _ChallengState extends State<Challeng>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    super.initState();
  }

  @override
  void disposed() {
    _animationController.dispose();
    super.dispose();
  }

  Widget mini() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.ac_unit),
          GestureDetector(
              onTap: () {
                setState(() {
                  estado = true;
                });

                _animationController.forward();
              },
              child: Icon(Icons.ac_unit)),
          Icon(Icons.ac_unit)
        ],
      ),
      width: 100,
      height: 80,
      decoration: BoxDecoration(
          color: Colors.amberAccent, borderRadius: BorderRadius.circular(10)),
    );
  }

  Widget expandido() {
    return Container(
      height: 160,
      decoration: BoxDecoration(
          gradient: migradiente,
          color: Colors.pink[600],
          borderRadius: BorderRadius.circular(10)),
    );
  }

  bool estado = false;

  @override
  Widget build(BuildContext context) {
    final double maximo = 300;
    final double minimo = 100;
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
                  print('update');
                  _animationController.reverse();
                });
              }
            : null,
        onVerticalDragEnd: estado
            ? (x) {
                estado = false;
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
                  child: estado ? expandido() : mini(),
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
              //title: Image.network(xxx.asset),
            ),
        ],
      ),
    );
  }
}
