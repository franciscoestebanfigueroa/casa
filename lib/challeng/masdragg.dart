import 'package:flutter/material.dart';
import 'package:wapp/utilidades/tarjetas.dart';

class MasDragg extends StatefulWidget {
  const MasDragg({Key key}) : super(key: key);

  @override
  _MasDraggState createState() => _MasDraggState();
}

class _MasDraggState extends State<MasDragg> {
  double _valuescrolleable = 0.0;
  int _foto;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            child: Image.network(
              '${tarjetas[0].asset}/$_foto/640/480',
              fit: BoxFit.fitHeight,
            ),
            color: Colors.orange,
          ),
          NotificationListener<DraggableScrollableNotification>(
            onNotification: (notificacion) {
              // print('notificacion ${notificacion.extent}');

              setState(() {
                _valuescrolleable = ((notificacion.extent / .6) - .16);
                print('Scrolable ${_valuescrolleable}');
              });

              return true;
            },
            child: DraggableScrollableSheet(
              initialChildSize: 0.1,
              minChildSize: .1,
              maxChildSize: .7,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return ListView.builder(
                  controller: scrollController,
                  itemCount: 40,
                  itemBuilder: (BuildContext context, int index) {
                    final valueindex = index + 10;

                    return Container(
                      color: Colors.grey,
                      child: ListTile(
                        onTap: () {
                          if (_valuescrolleable > .9) {
                            setState(() {
                              print(_foto);
                              _foto = valueindex;
                            });
                          }
                        },
                        contentPadding: EdgeInsets.all(10),
                        title: Text(
                          'Foto numero $valueindex',
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: Image.network(
                            '${tarjetas[0].asset}/$valueindex/640/480'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Positioned(
            top: (1 - _valuescrolleable) * -300,
            width: size.width,
            height: size.height * .29,
            child: Container(
                child: Image.network(
                  '${tarjetas[0].asset}/$_foto/640/480',
                ),
                color: Colors.grey),
          ),
          Container(
            height: kToolbarHeight,
            child: AppBar(
              foregroundColor: Colors.red,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text('MasDragg', style: TextStyle(color: Colors.black)),
              centerTitle: true,
            ),
          ),
        ],
      ),
    );
  }
}
