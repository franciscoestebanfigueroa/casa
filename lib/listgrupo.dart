import 'package:flutter/material.dart';
import 'package:wapp/pagechat.dart';

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
      onTap: () {
        Navigator.pushNamed(context, '//', arguments: xx);
      },
      title: Text('${xx.nombre}'), //data devuelve un map
      subtitle: Text(xx.id),
      trailing: Text('10 / 12 / 2021'),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.teal,
        ),
      ),
    );
  }
}
