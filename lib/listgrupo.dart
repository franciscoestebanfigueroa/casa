import 'package:flutter/material.dart';

import 'model/grupo.dart';

class ListGrupo extends StatelessWidget {
  const ListGrupo({
    Key key,
    @required this.xx,
  }) : super(key: key);

  final Grupo xx;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${xx.nombre}'), //data devuelve un map
    );
  }
}
