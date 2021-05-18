import 'package:flutter/material.dart';
import 'package:wapp/block/blockdemo.dart';

class BlockDemo extends StatelessWidget {
  final productosblock = ProductosBlock();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: StreamBuilder(
            stream: productosblock.contadordias,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Text('Dia ${snapshot.data ?? 'Cargando..'}');
            },
          ),
        ),
        body: StreamBuilder(
          stream: productosblock.getproductos,
          builder:
              (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
            print(snapshot.data);
            final datos =
                snapshot.data ?? ['Cargando...']; //si es null cerga cero[]
            return ListView.builder(
              itemCount: datos.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('${datos[index]}'),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
