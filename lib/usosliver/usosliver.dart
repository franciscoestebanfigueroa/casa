import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wapp/utilidades/tarjetas.dart';

const _size = 150.0;

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
          //backgroundColor: Colors.black,
          body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Placeholder(
                fallbackHeight: 150,
              ),
            ),
            SliverAppBar(
              pinned: true,
              centerTitle: true,
              title: Text(
                'Listado de Productos',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              backgroundColor: Colors.white,
              elevation: 50,
              //centerTitle: true,
              // expandedHeight: 120, //tamaño del Appbar
              floating: true, //baja el appbar cada vez que baja el scroll
              // automaticallyImplyLeading: false,
              stretch: true,
              /*1 flexibleSpace: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/logo.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),*/
              // title: Text('Sliver'),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 50,
              ),
            ),
            SliverList(
              //delegate: SliverChildListDelegate(miswidget),

              delegate: SliverChildBuilderDelegate((context, index) {
                final child = tarjetas[index];
                final itemposicion = (index * (_size / 2));
                final diferencia = scrollController.offset - itemposicion;
                final porcentaje = 1 - (diferencia / _size / 2);
                double opacity = porcentaje;
                if (porcentaje > 1) opacity = 1;
                if (porcentaje < 0) opacity = 0;
                if (true) {
                  print('index ${index}  ${porcentaje}');
                }

                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    //  ..rotateX(2 * pi * opacity)
                    ..scale(opacity)
                  //   ..setEntry(3, 2, 0.001)
                  ,
                  child: Transform.scale(
                    scale: 1,
                    child: Opacity(
                      opacity: opacity,
                      child: Align(
                        heightFactor:
                            0.5, //nos permite zolapar..pero hay que ajustar el calculo del size
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50))),
                          color: child.color,
                          child: SizedBox(
                            height: 150,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      child.nombre,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 50,
                                    foregroundImage: NetworkImage(
                                        '${child.asset}$index/100'),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }, childCount: tarjetas.length),
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
