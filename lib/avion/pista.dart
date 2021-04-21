import 'package:flutter/material.dart';

class Pista extends StatefulWidget {
  Pista({Key key}) : super(key: key);

  @override
  _PistaState createState() => _PistaState();
}

class _PistaState extends State<Pista> {
  bool activo = false;

  bool animation = false;
  void tempanimation() async {
    activo = !activo;
    await Future.delayed(Duration(milliseconds: 1200));
    setState(() {
      animation = true;
      print('primer deley');
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      //nos sirve para darnos los tamaños a travez del constains
      builder: (context, constraints) {
        return Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 250),
              bottom: 5,
              top: activo ? 0 : constraints.maxHeight,
              left: (MediaQuery.of(context).size.width / 2) - 14,
              child: Container(
                color: Colors.grey[300],
                width: 6,
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 450),
              curve: Curves.easeInOut,

              left: (MediaQuery.of(context).size.width / 2) - 36,
              //top: activo ?: ,
              bottom: activo ? constraints.maxHeight - 50 : 0,
              child: Container(
                child: Icon(
                  Icons.airplanemode_on,
                  color: Colors.red,
                  size: 50,
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 650),
              left: constraints.maxWidth / 2 - 8,
              top: activo ? 60 : constraints.maxHeight,
              child: Row(
                children: [
                  Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    // color: Colors.white,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 5,
                    ),
                  ),
                  CardEscala(
                    left: true,
                    onwiev: animation,
                    tempo: 200,
                    nombre: 'Lara',
                  )
                ],
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 950),
              right: constraints.maxWidth / 2 - 4,
              top: activo ? 120 : constraints.maxHeight,
              child: Row(
                children: [
                  CardEscala(
                    onwiev: animation,
                    tempo: 400,
                    nombre: 'Estaban',
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 5,
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 1200),
              left: constraints.maxWidth / 2 - 6,
              top: activo ? 180 : constraints.maxHeight,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.orange,
                    radius: 5,
                  ),
                  CardEscala(
                    onwiev: animation,
                    left: true,
                    tempo: 600,
                    nombre: 'Carolina',
                  )
                ],
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 1200),
              right: constraints.maxWidth / 2 - 4,
              top: activo ? 240 : constraints.maxHeight,
              child: Row(
                children: [
                  CardEscala(
                    onwiev: animation,
                    tempo: 800,
                    nombre: 'Pancho',
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.yellow,
                    radius: 5,
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 1100),
              left: constraints.maxWidth / 2 - 6,
              top: activo ? 300 : constraints.maxHeight,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 5,
                  ),
                  CardEscala(
                    left: true,
                    onwiev: animation,
                    tempo: 1000,
                  ),
                ],
              ),
            ),
            Positioned(
              left: constraints.maxWidth / 2 - 30,
              bottom: 0,
              child: Center(
                child: FloatingActionButton(
                    child: Icon(
                      Icons.check,
                      color: activo ? Colors.red : null,
                    ),
                    onPressed: () {
                      setState(() {
                        tempanimation();
                        //activo = !activo;
                      });
                    }),
              ),
            )
          ],
        );
      },
    );
  }
}

class CardEscala extends StatefulWidget {
  final bool left;
  final bool onwiev;
  final int tempo;
  final String nombre;
  CardEscala(
      {Key key,
      this.left = false,
      this.onwiev = false,
      this.tempo = 10,
      this.nombre = 'Sin dato'})
      : super(key: key);

  @override
  _CardEscalaState createState() => _CardEscalaState();
}

class _CardEscalaState extends State<CardEscala> {
  bool encender = false;
  void _enpiezaanimacion() async {
    await Future.delayed(Duration(milliseconds: widget.tempo));
    print('Segundo delay');
    setState(() {
      encender = true;
    });
  }

  @override
  void didUpdateWidget(CardEscala oldWidget) {
    if (widget.onwiev) _enpiezaanimacion();
    print('diduptadewidget');
    super.didUpdateWidget(oldWidget);
  }

  Widget linea() => Container(
        width: 20,
        height: 6,
        color: Colors.grey[300],
      );

  Widget texto() => Container(
        decoration: BoxDecoration(
          border: Border.all(),
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.nombre.toUpperCase(),
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      if (encender && widget.onwiev) ...[
        if (widget.left) ...[linea()],
        TweenTexto(child: texto()),
        if (!widget.left) ...[linea()],
      ],
    ]);
  }
}

class TweenTexto extends StatelessWidget {
  final Widget child;
  const TweenTexto({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 300),
      tween: Tween(begin: 0.0, end: 1.0),
      child: child,
      builder: (context, value, child) {
        return Transform.rotate(
          angle: value * 6.28,
          origin: Offset(10, 10),
          child: Transform.scale(
            scale: value,
            child: child,
          ),
        );
      },
    );
  }
}
