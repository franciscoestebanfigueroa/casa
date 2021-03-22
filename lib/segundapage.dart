import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Pruebafire extends StatelessWidget {
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
