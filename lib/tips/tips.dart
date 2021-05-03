import 'package:flutter/material.dart';
import 'package:wapp/delivery/widget_boton.dart';
import 'package:wapp/utilidades/tarjetas.dart';
import 'package:wapp/utilidades/temas.dart';

class Tips extends StatefulWidget {
  const Tips({Key key}) : super(key: key);

  @override
  _TipsState createState() => _TipsState();
}

class _TipsState extends State<Tips> {
  String xx = 'Esperando listener';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${xx}'),
      ),
      body: NotificationListener<_MiNotificacion>(
        onNotification: (x) {
          print(x.valor);
          xx = x.valor;
          setState(() {});
          return false;
        },
        child: DecoratedBox(
          decoration: BoxDecoration(gradient: migradiente),
          child: ListView.builder(
            // scrollDirection: Axis.horizontal,
            itemCount: tarjetas.length,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                alignment: Alignment.topCenter,
                children: [
                  Align(
                    widthFactor: 0.7, //factor de ancho, superpone
                    heightFactor: 0.7,
                    child: ClipOval(
                      child: Image.network(
                        '${tarjetas[index].asset}/$index/300/300',
                        fit: BoxFit.cover,
                        width: 300,
                        height: 300,
                      ),
                    ),
                  ),
                  _Boton(),
                  Text(xx),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _Boton extends StatelessWidget {
  const _Boton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BotonGenerico(
        nombre: 'Listener',
        ontap: () {
          print('notif01');
          _MiNotificacion()
            ..valor
            ..dispatch(context);
        },
        fontsize: 20,
      ),
    );
  }
}

class _MiNotificacion extends Notification {
  final String valor = 'Con listener..';
}
