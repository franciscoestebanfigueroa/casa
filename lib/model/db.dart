import 'package:wapp/model/grupo.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as fire;

Stream<List<Grupo>> mystream() {
  return fire.FirebaseFirestore.instance
      .collection('grupos')
      .snapshots()
      .map(tolistgrupo);
}

Stream<List<DatosMensaje>> streamMensaje(String id) {
  return fire.FirebaseFirestore.instance
      .collection('grupos')
      .doc(id)
      .collection('mensaje')
      .orderBy('datetime', descending: true)
      .snapshots()
      .map(datosMensaje);
}

Future<void> enviar(String id, Map<String, dynamic> mapa) async {
  await fire.FirebaseFirestore.instance
      .collection('grupos')
      .doc(id)
      .collection('mensaje')
      .add(mapa);
}
