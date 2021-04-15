import 'package:flutter/material.dart';
import 'package:wapp/model/db.dart' as db;
import 'package:wapp/model/grupo.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Grupo xx = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        backgroundColor: Colors.teal[100],
        appBar: AppBar(
          title: Text('Sala.. ${xx.nombre}'),
        ),
        body: Column(
          children: [
            Expanded(
                child: ChatList(
              id: xx.id,
            )),
            CajaTxtBoton(funcion: (txt) {
              print('el dato $txt');
              final chatclase = DatosMensaje(txt);
              Map<String, dynamic> mapa = chatclase.mapa();
              db.enviar(xx.id, mapa);
            }),
          ],
        ));
  }
}

class ChatList extends StatelessWidget {
  String xid;
  ChatList({String id}) : xid = id;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: db.streamMensaje(xid),
      builder:
          (BuildContext context, AsyncSnapshot<List<DatosMensaje>> snapshot) {
        List<DatosMensaje> doc = snapshot.data;
        if (snapshot.hasError) {
          return Center(child: Text('Error ${snapshot.error}'));
        }
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemExtent: 25,
            padding: EdgeInsets.only(bottom: 20),
            reverse: true,
            itemCount: doc.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Row(
                  children: [
                    Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(3),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            child: Text(' ${doc[index].texto} ',
                                style: TextStyle(fontSize: 16)),
                          ),
                          Container(
                            child: Text(
                              ' ${doc[index].hhmm} ',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}

class CajaTxtBoton extends StatefulWidget {
  Function funcion;
  CajaTxtBoton({this.funcion});
  @override
  _CajaTxtBotonState createState() => _CajaTxtBotonState();
}

class _CajaTxtBotonState extends State<CajaTxtBoton> {
  TextEditingController _controler;

  @override
  void initState() {
    _controler = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controler.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              shape: StadiumBorder(),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  onSubmitted: (e) {
                    enviar();
                  },
                  controller: _controler,
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: '  Mensaje',
                    /*suffixIcon: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: enviar,
                    ),*/
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 0,
          child: Material(
            color: Theme.of(context).primaryColor,
            shape: CircleBorder(),
            child: TextButton(
              child: Icon(
                Icons.send,
                color: Colors.white,
              ),
              onPressed: () {
                enviar();
              },
            ),
          ),
        )
      ],
    );
  }

  void enviar() {
    setState(() {
      widget.funcion(_controler.text);
      _controler.clear();
    });

    //print(_controler.text);
  }
}
