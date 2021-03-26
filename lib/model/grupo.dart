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
