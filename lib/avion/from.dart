import 'package:flutter/material.dart';

class Formulario extends StatelessWidget {
  final VoidCallback miOnTap;
  const Formulario({Key key, this.miOnTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        child: ListView(children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Nombre'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Apellido'),
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(labelText: 'Dni'),
            ),
          ),
          Divider(
            color: Colors.red,
          ),
          FloatingActionButton(onPressed: miOnTap, child: Icon(Icons.check)),
        ]),
      ),
    );
  }
}
