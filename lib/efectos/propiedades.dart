import 'package:flutter/material.dart';

class Propiedades extends StatelessWidget {
  final int index;
  const Propiedades({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles'),
      ),
    );
  }
}
