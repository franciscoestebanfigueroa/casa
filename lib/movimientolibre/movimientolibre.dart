import 'dart:math';
//hola pancho xxxx seguro
import 'package:flutter/material.dart';
import 'package:wapp/utilidades/temas.dart';
import 'package:wapp/widgetpersinalizado/widgetpersonalizado.dart';

class MovimientoLibre extends StatefulWidget {
  MovimientoLibre({Key key}) : super(key: key);

  @override
  _MovimientoLibreState createState() => _MovimientoLibreState();
}

class _MovimientoLibreState extends State<MovimientoLibre> {
  Offset offset = Offset(0.0, 0);
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateY(2 * pi * offset.dx * 0.001)
        ..rotateX(2 * pi * offset.dy * 0.001),
      alignment: Alignment.center,
      child: GestureDetector(
        onDoubleTap: () {
          offset = Offset.zero;
          setState(() {});
        },
        onPanUpdate: (diferencial) {
          setState(() {
            offset += diferencial.delta;
            print('dx ${offset.dx}');
            print(offset.dy);
          });
        },
        child: Skfold(),
      ),
    );
  }
}

class Skfold extends StatefulWidget {
  @override
  _SkfoldState createState() => _SkfoldState();
}

class _SkfoldState extends State<Skfold> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));
    animation = Tween(end: 1.0, begin: 0.0).animate(animationController);
    animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pancho'),
      ),
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
              animation: animation,
              builder: (context, _) {
                //  print('controloer.value  ${animationController.value}');
                return Transform.rotate(
                  angle: 2 * pi * animationController.value,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: migradiente,
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(300)),
                    alignment: Alignment.center,
                    child: Text(
                      'Pancho',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                    ),
                    height: 100,
                    width: 300,
                  ),
                );
              }),
          SizedBox(
            height: 200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Boton(
                childrenIcons: [
                  IconButton(
                      icon: Icon(Icons.chat),
                      onPressed: () {
                        animationController.stop();
                      }),
                  IconButton(
                      icon: Icon(Icons.chat),
                      onPressed: () {
                        animationController.repeat();
                      }),
                  IconButton(
                      icon: Icon(Icons.chat),
                      onPressed: () {
                        animationController.fling();
                      }),
                  IconButton(
                      icon: Icon(Icons.chat),
                      onPressed: () {
                        animationController.forward();
                      })
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
