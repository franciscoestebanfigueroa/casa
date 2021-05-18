import 'package:flutter/material.dart';

//import 'package:firebase_core/firebase_core.dart';
import 'package:wapp/avion/avion.dart';
import 'package:wapp/challeng/challeng.dart';
import 'package:wapp/challeng/masdragg.dart';
import 'package:wapp/chat/pagechat.dart';
import 'package:wapp/chat/segundapage.dart';
import 'package:wapp/delivery/delivery.dart';
import 'package:wapp/delivery/pedidos.dart';
import 'package:wapp/tips/tips.dart';
import 'package:wapp/widget/widget.dart';
import 'package:wapp/widgetpersinalizado/widgetpersonalizado.dart';

import 'animatedcontainer/containeranimed.dart';
import 'block/mainblock.dart';
import 'efectos/efectos.dart';
import 'efectos/propiedades.dart';
import 'flatmultiple/floatmultible.dart';
import 'movimientolibre/movimientolibre.dart';
import 'usosliver/usosliver.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      title: 'Programas',
      initialRoute: '/',
      routes: {
        '/': (contex) => Sfo(),
        '///': (context) => Chat(),
        '/chat': (contex) => Pruebafire(),
        '/avion': (contex) => Avion(),
        '/efectos': (_) => Efectos(),
        '/propiedades': (_) => Propiedades(),
        '/widgetpersonalizado': (_) => WidgetPersonalizado(),
        '/containeranimed': (_) => ContainerAnimed(),
        '/movimientolibre': (_) => MovimientoLibre(),
        '/floatmultiple': (_) => CircularButtonFlating(),
        '/usosliver': (_) => UsoSliver(),
        '/delivery': (_) => Delivery(),
        '/pedidos': (_) => Pedidos(),
        '/tips': (_) => Tips(),
        '/widget': (_) => WidgetTodos(),
        '/opacityanimation': (_) => OpacityDemo(),
        '/fadedemo': (_) => FadeDemo(),
        '/pagedemo': (_) => PageDemo(),
        '/tabledemo': (_) => TableDemo(),
        '/challeng': (_) => Challeng(),
        '/reordenable': (_) => Reordenable(),
        '/transition': (_) => TransitionDemo(),
        '/crossfade': (_) => CrossFadeDemo(),
        '/draggablscrollable': (_) => DraggableScrollableSheetDemo(),
        '/masdragg': (_) => MasDragg(),
        '/blockdemo': (_) => BlockDemo(),
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
          title: Text('Programas'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
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
                ),
                SizedBox(
                  height: 20,
                ),
                Botones(
                  color: Colors.orange,
                  axis: Axis.horizontal,
                  texto: 'Widget personalizado',
                  duration: Duration(milliseconds: 1200),
                  ruta: '/widgetpersonalizado',
                ),
                SizedBox(
                  height: 20,
                ),
                Botones(
                  color: Colors.orange,
                  axis: Axis.horizontal,
                  texto: 'Container Animado',
                  duration: Duration(milliseconds: 1200),
                  ruta: '/containeranimed',
                ),
                SizedBox(
                  height: 20,
                ),
                Botones(
                  color: Colors.orange,
                  axis: Axis.horizontal,
                  texto: 'Movimiento Libre',
                  duration: Duration(milliseconds: 1200),
                  ruta: '/movimientolibre',
                ),
                SizedBox(
                  height: 20,
                ),
                Botones(
                  color: Colors.orange,
                  axis: Axis.horizontal,
                  texto: 'Float Multiple',
                  duration: Duration(milliseconds: 1200),
                  ruta: '/floatmultiple',
                ),
                SizedBox(
                  height: 20,
                ),
                Botones(
                  color: Colors.orange,
                  axis: Axis.horizontal,
                  texto: 'Uso Sliver',
                  duration: Duration(milliseconds: 1200),
                  ruta: '/usosliver',
                ),
                SizedBox(
                  height: 20,
                ),
                Botones(
                  color: Colors.orange,
                  axis: Axis.horizontal,
                  texto: 'Delivery',
                  duration: Duration(milliseconds: 1200),
                  ruta: '/delivery',
                ),
                SizedBox(
                  height: 20,
                ),
                Botones(
                  color: Colors.green,
                  axis: Axis.vertical,
                  texto: 'Tips',
                  duration: Duration(milliseconds: 1400),
                  ruta: '/tips',
                ),
                SizedBox(
                  height: 20,
                ),
                Botones(
                  color: Colors.green,
                  axis: Axis.vertical,
                  texto: 'Widget Demo',
                  duration: Duration(milliseconds: 1800),
                  ruta: '/widget',
                ),
                SizedBox(
                  height: 20,
                ),
                Botones(
                  color: Colors.green,
                  axis: Axis.vertical,
                  texto: 'Challeng',
                  duration: Duration(milliseconds: 1800),
                  ruta: '/challeng',
                ),
                SizedBox(
                  height: 20,
                ),
                Botones(
                  color: Colors.pink,
                  axis: Axis.vertical,
                  texto: 'MasDragg',
                  duration: Duration(milliseconds: 1800),
                  ruta: '/masdragg',
                ),
                SizedBox(
                  height: 20,
                ),
                Botones(
                  color: Colors.pink,
                  axis: Axis.vertical,
                  texto: 'Block',
                  duration: Duration(milliseconds: 1800),
                  ruta: '/blockdemo',
                )
              ],
            ),
          ),
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
