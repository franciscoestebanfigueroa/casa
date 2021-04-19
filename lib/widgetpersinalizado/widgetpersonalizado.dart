import 'dart:ui';

import 'package:flutter/material.dart';

final colorfondo = [Colors.blue, Colors.white];

class WidgetPersonalizado extends StatelessWidget {
  const WidgetPersonalizado({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData.dark(),
        child: DecoratedBox(
          decoration:
              BoxDecoration(gradient: LinearGradient(colors: colorfondo)),
          child: Scaffold(
            appBar: AppBar(),
            backgroundColor: Colors.transparent,
            body: Center(
              child: Boton(
                childrenIcons: [
                  IconButton(
                      icon: Icon(Icons.cached),
                      onPressed: () {
                        print('ok');
                      }),
                  IconButton(icon: Icon(Icons.access_alarm), onPressed: () {}),
                  IconButton(icon: Icon(Icons.deck_rounded), onPressed: () {}),
                  IconButton(icon: Icon(Icons.cached), onPressed: () {}),
                ],
              ),
            ),
          ),
        ));
  }
}

class Boton extends StatefulWidget {
  final double heightbuton;
  final String txt;
  final List<Widget> childrenIcons;

  const Boton(
      {@required this.childrenIcons,
      key,
      this.txt = 'Boton',
      this.heightbuton = 100})
      : super(key: key);

  @override
  _BotonState createState() => _BotonState();
}

class _BotonState extends State<Boton> {
  double ancho = 00;
  final _myglobalkey = GlobalKey();
  bool onoff = true;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        ancho = _myglobalkey.currentContext.size
            .width; //obtengo el tamaño del widget donde esta el key
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: widget.heightbuton, //alto
      child: Column(
        children: [
          MyEfecto(
            onoff: onoff,
            id: true,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10))),
              height: widget.heightbuton / 2,
              child: Row(
                key: _myglobalkey,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: widget.childrenIcons,
              ),
            ),
          ),
          MyEfecto(
            id: false,
            onoff: onoff,
            child: Material(
              color: Colors.black,
              elevation: 5,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  setState(() {
                    onoff = !onoff;
                    print(onoff);
                  });
                },
                child: Container(
                  width: ancho + 20,
                  alignment: Alignment.center,
                  height: widget.heightbuton / 2,
                  child: Text(
                    widget.txt,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyEfecto extends StatelessWidget {
  final Widget child;
  final double altura;
  final bool onoff;
  final bool id;
  const MyEfecto(
      {this.id, this.onoff = false, this.altura = 100, Key key, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration:
          onoff ? Duration(milliseconds: 300) : Duration(milliseconds: 600),
      child: child,
      tween: id
          ? (onoff ? Tween(end: 1.0, begin: 0.0) : Tween(end: 0.0, begin: 1.0))
          : (onoff
              ? Tween(end: -1.0, begin: 0.0)
              : Tween(end: 0.0, begin: -1.0)),
      builder: (BuildContext context, double value, Widget child) {
        return Transform.translate(
          child: child,
          offset: Offset(
            0.0,
            ((altura / 4) * value),
          ),
        );
      },
    );
  }
}
