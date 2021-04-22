import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wapp/utilidades/tarjetas.dart';

class UsoSliver extends StatefulWidget {
  @override
  _UsoSliverState createState() => _UsoSliverState();
}

class _UsoSliverState extends State<UsoSliver> {
  final rndx = Random();
  ScrollController scrollController;
  void micontroler() {
    setState(() {
      print(scrollController);
    });
  }

  @override
  void initState() {
    scrollController = ScrollController();

    scrollController.addListener(() {});
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
    print(scrollController);
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        slivers: <Widget>[
          SliverAnimatedList(
            itemBuilder: (BuildContext context, int index,
                Animation<double> animation) {},
          ),
          SliverAppBar(
            //centerTitle: true,
            expandedHeight: 120, //tamaño del Appbar
            floating: true, //baja el appbar cada vez que baja el scroll
            automaticallyImplyLeading: false,
            stretch: true,
            flexibleSpace: Image.asset(
              'assets/logo.jpg',
              fit: BoxFit.cover,
            ),
            // title: Text('Sliver'),
          ),
          SliverList(
            delegate: SliverChildListDelegate(miswidget),
          ),
        ],
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
