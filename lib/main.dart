import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:wapp/avion/avion.dart';
import 'package:wapp/pagechat.dart';
import 'package:wapp/segundapage.dart';

import 'efectos/efectos.dart';
import 'efectos/propiedades.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // FirebaseApp defaultApp = Firebase.app();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.red),
      title: 'Chat',
      initialRoute: '/',
      routes: {
        '/': (contex) => Sfo(),
        '//': (context) => Chat(),
        '/chat': (contex) => Pruebafire(),
        '/avion': (contex) => Avion(),
        '/efectos': (_) => Efectos(),
        '/propiedades': (_) => Propiedades(
              index: 3,
            )
      },
    );
  }
}

class Sfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chat 2.0'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Botones(
              duration: Duration(milliseconds: 900),
              texto: 'chat',
              ruta: '/chat',
              color: Colors.amberAccent[400],
            ),
            SizedBox(
              height: 20,
            ),
            Botones(
              color: Colors.orange,
              axis: Axis.horizontal,
              texto: 'Avión',
              duration: Duration(milliseconds: 1200),
              ruta: '/avion',
            ),
            SizedBox(
              height: 20,
            ),
            Botones(
              color: Colors.orange,
              axis: Axis.horizontal,
              texto: 'Efectos',
              duration: Duration(milliseconds: 1200),
              ruta: '/efectos',
            )
          ],
        ),
      ),
    );
  }
}

class Botones extends StatelessWidget {
  final Color color;
  final String texto;
  final Duration duration;
  final Axis axis;
  final String ruta;

  const Botones(
      {Key key,
      this.color = Colors.teal,
      @required this.texto,
      @required this.duration,
      this.axis,
      @required this.ruta})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MyTween(
      duration: duration,
      pocition: MediaQuery.of(context).size.height,
      axis: axis,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed(ruta);
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          constraints: BoxConstraints(minHeight: 10, minWidth: double.infinity),
          child: Text(
            texto,
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}

class MyTween extends StatelessWidget {
  final Duration duration;
  final Axis axis;
  final double pocition;
  final Widget child;

  const MyTween({
    this.duration,
    this.axis = Axis.horizontal,
    this.pocition = 140,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 1, end: 0),
      curve: Curves.fastLinearToSlowEaseIn,
      child: child,
      duration: duration,
      builder: (contex, value, child) {
        return Transform.translate(
            child: child,
            offset: axis == Axis.horizontal
                ? Offset(value * pocition, 0.0)
                : Offset(0.0, value * pocition));
      },
    );
  }
}
