import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:wapp/avion/pista.dart';

import 'from.dart';

enum Listado { form, avion }

class Avion extends StatefulWidget {
  @override
  _AvionState createState() => _AvionState();
}

class _AvionState extends State<Avion> {
  final String nombre = 'nombre';
  final String ruta = '/';
  Listado listado = Listado.form;

  void llamafuncion() {
    setState(() {
      listado = Listado.avion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            title: Text('Aviones'),
          ),
          body: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                left: 0,
                right: 0,
                height: MediaQuery.of(context).size.height * 0.32,
                top: 0,
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Vuelos Micasa',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BotonesCabezera(ruta: '/', nombre: 'Inicio'),
                          SizedBox(
                            width: 20,
                          ),
                          BotonesCabezera(ruta: '/', nombre: 'Inicio'),
                          SizedBox(
                            width: 20,
                          ),
                          BotonesCabezera(ruta: '/', nombre: 'Inicio'),
                        ],
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                      colors: [Colors.red, Colors.red[300]],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 10,
                right: 10,
                top: (MediaQuery.of(context).size.height * 0.32 / 2),
                bottom: 10,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: MediaQuery.of(context).size.height,
                  child: listado == Listado.form
                      ? Formulario(
                          miOnTap: llamafuncion,
                        )
                      : Pista(),
                ),
              ),
            ],
          )),
    );
  }
}

class BotonesCabezera extends StatelessWidget {
  const BotonesCabezera({
    Key key,
    @required this.ruta,
    @required this.nombre,
  }) : super(key: key);

  final String ruta;
  final String nombre;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          return Navigator.of(context).pushNamed(ruta);
        },
        child: Text(nombre));
  }
}
