import 'package:flutter/material.dart';
import 'package:wapp/model/db.dart' as db;
import 'package:wapp/model/grupo.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Grupo xx = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text(xx.id),
        ),
        body: Column(
          children: [
            Expanded(
                child: ChatList(
              id: xx.id,
            )),
            CajaTxtBoton(),
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
            itemCount: doc.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                //leading: Text('data'),
                title: Text('${doc[index].texto}'),
              );
            },
          );
        }
      },
    );
  }
}

class CajaTxtBoton extends StatefulWidget {
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onSubmitted: (dato) {
          enviar();
        },
        controller: _controler,
        decoration: InputDecoration(
          hintText: '  Mensaje',
          suffixIcon: IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              enviar();
            },
          ),
        ),
      ),
    );
  }

  Future<void> enviar() async {
    await print(_controler.text);
    _controler.clear();
  }
}
