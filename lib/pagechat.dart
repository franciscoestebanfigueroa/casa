import 'package:flutter/material.dart';
import 'package:wapp/model/grupo.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Grupo xx = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(xx.nombre),
      ),
      body: Center(
        child: Container(
          child: Text('${xx.nombre.toString()}'),
        ),
      ),
    );
  }
}
