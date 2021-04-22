import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wapp/utilidades/tarjetas.dart';

class UsoSliver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliver'),
      ),
      body: ListView.builder(
        itemCount: tarjetas.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            contentPadding: EdgeInsets.all(15),
            trailing: Text(tarjetas[index].descripcion),
            title: Text(tarjetas[index].nombre),
            tileColor: tarjetas[index].color,
            leading: Image.asset('assets/logo.jpg'),
          );
        },
      ),
    );
  }
}
