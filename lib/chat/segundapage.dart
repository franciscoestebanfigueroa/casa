import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wapp/model/db.dart';
import 'package:wapp/model/grupo.dart';

import 'listgrupo.dart';

class Pruebafirex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference datosfire =
        FirebaseFirestore.instance.collection('grupos');
    return StreamBuilder(
      stream: datosfire.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return Center(child: Text('Error ${snapshot.error.toString()}'));
        if (snapshot.connectionState == ConnectionState.waiting)
          return CircularProgressIndicator();
        else {
          List<QueryDocumentSnapshot> datos = snapshot.data.docs;

          return new ListView.builder(
            itemCount: datos.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                    '${datos[index].data()['nombre']}'), //data devuelve un map
              );
            },
          );
        }
      },
    );
  }
}

class Pruebafire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: mystream(),
        builder: (BuildContext context, AsyncSnapshot<List<Grupo>> snapshot) {
          if (snapshot.hasError)
            return Center(child: Text('Error ${snapshot.error.toString()}'));
          if (snapshot.connectionState == ConnectionState.waiting)
            return CircularProgressIndicator();
          else {
            List<Grupo> datos = snapshot.data;

            return new ListView.separated(
              separatorBuilder: (context, int) {
                return Divider(
                  thickness: 2,
                );
              },
              itemCount: datos.length,
              itemBuilder: (BuildContext context, int index) {
                final xx = datos[index];
                return ListGrupo(xx: xx);
              },
            );
          }
        },
      ),
    );
  }
}
