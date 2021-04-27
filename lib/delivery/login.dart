import 'package:flutter/material.dart';

class MateriaLogin extends StatelessWidget {
  const MateriaLogin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controller;
  bool estadopass = true;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
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
            child: Stack(
              children: [
                Positioned(
                  top: -360,
                  left: 0,
                  height: 600,
                  width: size.width,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(600),
                      color: Colors.purple,
                    ),
                  ),
                ),
                Positioned(
                  top: size.height / 6,
                  right: (size.width / 2) - 60,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
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
                  padding: const EdgeInsets.only(left: 140, right: 140),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(labelText: 'Usuario'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 140, right: 140),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _controller,
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
                        labelText: 'Password'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
