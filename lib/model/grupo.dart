import 'package:cloud_firestore/cloud_firestore.dart' as fire;

class Grupo {
  String nombre;
  String id;

  Grupo.fromFirestore(fire.DocumentSnapshot doc)
      : id = doc.id,
        nombre = doc.data()['nombre'];
}

List<Grupo> tolistgrupo(fire.QuerySnapshot query) {
  return query.docs.map((e) => Grupo.fromFirestore(e)).toList();
}

class DatosMensaje {
  String texto;
  String mensajeId;
  DateTime datetime;

  DatosMensaje(fire.DocumentSnapshot docmensaje)
      : texto = docmensaje.data()['texto'],
        //datetime = (docmensaje.data()['datatime']),
        mensajeId = docmensaje.id;
}

List<DatosMensaje> datosMensaje(fire.QuerySnapshot query2) {
  return query2.docs.map((e) => DatosMensaje(e)).toList();
}
