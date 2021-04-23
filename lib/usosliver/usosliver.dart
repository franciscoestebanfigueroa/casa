import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wapp/utilidades/tarjetas.dart';

const size = 150.0;

class UsoSliver extends StatefulWidget {
  @override
  _UsoSliverState createState() => _UsoSliverState();
}

class _UsoSliverState extends State<UsoSliver> {
  final rndx = Random();
  ScrollController scrollController;
  void micontroler() {
    setState(() {});
  }

  @override
  void initState() {
    scrollController = ScrollController();

    scrollController.addListener(() {
      micontroler();
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    scrollController.removeListener(() {});
    super.dispose();
  }

  final List<Widget> miswidget = List.generate(
    100,
    (x) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: tarjetas[Random().nextInt(10)].color,
        ),
        width: double.infinity,
        height: 100,
        //child: Text('${Random().nextInt(10)}'),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            /* SliverAppBar(
              //centerTitle: true,
              expandedHeight: 120, //tamaño del Appbar
              floating: true, //baja el appbar cada vez que baja el scroll
              // automaticallyImplyLeading: false,
              stretch: true,
              flexibleSpace: Image.asset(
                'assets/logo.jpg',
                fit: BoxFit.cover,
              ),
              // title: Text('Sliver'),
            ),*/
            SliverList(
              //delegate: SliverChildListDelegate(miswidget),

              delegate: SliverChildBuilderDelegate((context, index) {
                final child = tarjetas[index];
                final desplazaminto = (index * size) - scrollController.offset;
                final pasoauno = 1 - (desplazaminto / (index * size));

                if (true) {
                  print('se desplazo hacia arriba ${desplazaminto}');

                  print('paso a uno ${pasoauno}');
                  print(index);
                }

                return SizedBox(
                  height: 150,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              child.nombre,
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            child.descripcion,
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '  $index',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    color: child.color,
                  ),
                );
              }, childCount: 10),
            ),
          ],
        ),
      )),
    );
  }
}

class ConListView extends StatelessWidget {
  const ConListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tarjetas.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            contentPadding: EdgeInsets.all(15),
            trailing: Text(tarjetas[index].descripcion),
            title: Text(tarjetas[index].nombre),
            tileColor: tarjetas[index].color,
            leading: Image.asset('assets/logo.jpg'),
          ),
        );
      },
    );
  }
}
