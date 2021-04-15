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

  DatosMensaje(this.texto) : datetime = DateTime.now();

  String get hhmm =>
      '${datetime.hour.toString().padLeft(2, '0')}.:${datetime.minute.toString().padLeft(2, '0')}';

  DatosMensaje.defire(fire.DocumentSnapshot docmensaje)
      : texto = docmensaje.data()['texto'],
        datetime = (docmensaje.data()['datetime'] as fire.Timestamp).toDate(),
        mensajeId = docmensaje.id;

  Map<String, dynamic> mapa() => {'datetime': datetime, 'texto': texto};
}

List<DatosMensaje> datosMensaje(fire.QuerySnapshot query2) {
  return query2.docs.map((e) => DatosMensaje.defire(e)).toList();
}
