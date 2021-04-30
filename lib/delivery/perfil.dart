import 'package:flutter/material.dart';
import 'package:wapp/delivery/widget_boton.dart';

class Perfil extends StatelessWidget {
  const Perfil({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 3,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 90,
            child: FlutterLogo(
              size: 100,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Flutter',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 40),
                  ),
                  Text(
                    'Francisco Esteban',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Franciscoesteban@live.com',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0, right: 28),
                    child: BotonGenerico(
                      nombre: 'Salir',
                      fontsize: 18,
                      ontap: () {},
                    ),
                  )
                ],
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        )
      ],
    );
  }
}
