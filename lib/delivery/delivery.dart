import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wapp/delivery/login.dart';
import 'package:wapp/utilidades/temas.dart';

class Delivery extends StatelessWidget {
  const Delivery({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: mistemas,
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  void funcion() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return Login();
    }));
  }

  void funcion2() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Login();
    }));
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).whenComplete(() => funcion2());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        title: Text('Delivery'),
        centerTitle: true,
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue, Colors.purple])),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 120,
                //minRadius: 1,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FlutterLogo(
                    size: 600,
                  ),
                ),
              ),
              Text(
                'Pancho',
                style: (Theme.of(context).textTheme.headline4)
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
