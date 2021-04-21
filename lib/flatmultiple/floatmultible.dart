import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wapp/animatedcontainer/containeranimed.dart';

class CircularButtonFlating extends StatefulWidget {
  const CircularButtonFlating({Key key}) : super(key: key);

  @override
  _CircularButtonFlatingState createState() => _CircularButtonFlatingState();
}

class _CircularButtonFlatingState extends State<CircularButtonFlating>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  Animation animationratocion;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    animation = Tween<double>(begin: 0, end: 1).animate(animationController);
    animationratocion = Tween<double>(begin: 0, end: 360).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut));
    animationController.addListener(() {
      setState(() {});
    }); // ceo que no lo necesito?

    print(animationController.value);

    super.initState();
  }

  @override
  void dispose() {
    animation.isDismissed;
    animationController.dispose();
    super.dispose();
  }

  bool estado = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double fromgradosaradianes(double grados) {
      double factor = (pi / 180); //(1º * pi)180rad
      print(factor);
      return grados * factor;
    }

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(),
      body: Stack(children: [
        Positioned(
          bottom: 30,
          right: 30,
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset.fromDirection(
                    fromgradosaradianes(180), animationController.value * 100),
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationZ(
                      fromgradosaradianes(animationController.value * 180)),
                  child: Xboton(
                    colorx: Colors.orange,
                    alto: 55,
                    ancho: 55,
                    icon: Icon(
                      Icons.autorenew_sharp,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        AnimatedPositioned(
          bottom: estado ? -47 : 30,
          right: estado ? -47 : 30,
          duration: Duration(milliseconds: 300),
          curve: Curves.bounceOut,
          child: Transform.translate(
            offset: Offset.fromDirection(fromgradosaradianes(225), 110),
            child: Xboton(
              colorx: Colors.yellow,
              alto: 55,
              ancho: 55,
              icon: Icon(
                Icons.access_time_sharp,
                color: Colors.white,
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          bottom: estado ? -68 : 30,
          right: estado ? 33 : 30,
          curve: Curves.bounceOut,
          child: Transform.translate(
            offset: Offset.fromDirection(fromgradosaradianes(270), 100),
            child: Xboton(
              colorx: Colors.pink,
              alto: 55,
              ancho: 55,
              icon: Icon(
                Icons.camera,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: AnimatedBuilder(
            animation: animationController,
            builder: (BuildContext context, Widget child) {
              return Transform.rotate(
                angle: animationController.value * fromgradosaradianes(-90),
                child: Xboton(
                  funcion: () {
                    setState(() {
                      if (estado)
                        animationController.forward();
                      else
                        animationController.reverse();
                      estado = !estado;
                    });
                  },
                  colorx: Colors.blue,
                  alto: 60,
                  ancho: 60,
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}

class Xboton extends StatelessWidget {
  final Color colorx;
  final Icon icon;
  final Function funcion;
  final double ancho;
  final double alto;

  const Xboton(
      {Key key,
      this.colorx = Colors.red,
      @required this.icon,
      this.funcion,
      this.ancho = 100,
      this.alto = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ancho,
      height: alto,
      decoration: BoxDecoration(color: colorx, shape: BoxShape.circle),
      child: IconButton(
        icon: icon,
        onPressed: funcion,
      ),
    );
  }
}
