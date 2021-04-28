import 'package:flutter/material.dart';
import 'package:wapp/delivery/pedidos.dart';
import 'package:wapp/delivery/widget_boton.dart';

import 'package:wapp/utilidades/temas.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controller, _controllerpass;
  bool estadopass = true;
  @override
  void initState() {
    _controller = TextEditingController();
    _controllerpass = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerpass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Positioned(
                  top: -size.width - 60,
                  left: 0,
                  height: size.height - 60,
                  width: size.width,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.width),
                        gradient: LinearGradient(
                            colors: coloresgradiente,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.7, 1.0])),
                  ),
                ),
                Positioned(
                  top: size.height / 9,
                  right: (size.width / 2) - 60,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 60,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView(
              children: [
                Text(
                  'Delivery Las Obreras',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100, right: 100),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        labelStyle:
                            TextStyle(color: Theme.of(context).iconTheme.color),
                        labelText: 'Usuario'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100, right: 100),
                  child: TextField(
                    obscureText: !estadopass,
                    controller: _controllerpass,
                    decoration: InputDecoration(
                        suffix: IconButton(
                          icon: Icon(estadopass
                              ? Icons.remove_red_eye_outlined
                              : Icons.remove),
                          onPressed: () {
                            setState(() {
                              estadopass = !estadopass;
                            });
                          },
                        ),
                        labelStyle:
                            TextStyle(color: Theme.of(context).iconTheme.color),
                        labelText: 'Password'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Boton_generico(
                    nombre: 'Ingresar',
                    ontap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Pedidos();
                      }));
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
