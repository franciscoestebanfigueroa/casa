import 'dart:math';

import 'package:flutter/material.dart';

final String url = 'https://picsum.photos/id/';

class Efectos extends StatefulWidget {
  const Efectos({Key key}) : super(key: key);

  @override
  _EfectosState createState() => _EfectosState();
}

class _EfectosState extends State<Efectos> {
  bool grilla = false;
  double _value = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    icon: Icon(Icons.grid_on_sharp),
                    onPressed: () {
                      setState(() {
                        grilla = !grilla;
                      });
                      print(grilla);
                    })
              ],
              //leading: IconButton(

              title: Text('Efectos'),
              elevation: 0,
            ),
            body: ListView(
              children: [
                Container(
                  width: 600,
                  height: MediaQuery.of(context).size.height - 100,
                  child: grilla
                      ? ListadoFotos(
                          value: _value,
                        )
                      : Grillax(),
                ),
                SizedBox(
                  height: 0,
                ),
                Slider(
                    value: _value,
                    onChanged: (x) {
                      print(x.clamp(0, 1));
                      setState(() {
                        _value = x;
                      });
                    })
              ],
            )));
  }
}

class ListadoFotos extends StatelessWidget {
  final value;
  const ListadoFotos({Key key, this.value = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            // ..scale((2 * value) + 0.5)
            ..setEntry(3, 2, 0.001)
            ..rotateY(2 * pi * value),
          child: ListTile(
            contentPadding: EdgeInsets.only(left: 8, right: 8, top: 2),
            subtitle: Text('Foto $index/Sin Controler '),
            title: Image.network(
              '$url$index/600',
            ),
          ),
        );
      },
    );
  }
}

class Grillax extends StatefulWidget {
  const Grillax({Key key}) : super(key: key);

  @override
  _GrillaxState createState() => _GrillaxState();
}

class _GrillaxState extends State<Grillax> {
  PageController _pageControler;
  double numeropage = 0.0;
  void _listener() {
    setState(() {
      numeropage = _pageControler.page;
      print('numerodepage $numeropage');
    });
  }

  @override
  void initState() {
    _pageControler = PageController(viewportFraction: 0.50);
    _pageControler.addListener(() {
      _listener();
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageControler.dispose();
    _pageControler.removeListener(() {
      _listener();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        scrollDirection: Axis.vertical,
        controller: _pageControler,
        itemCount: 20,
        itemBuilder: (context, index) {
          final valor = (numeropage - index) + 0.5;
          final valorx = -0.4 * valor + 1;
          final opaciti = numeropage.clamp(0.0, 1.0);
          print('valorx $valorx');
          print('valor $valor');
          print('opaciti $opaciti');
          return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..translate(
                  0.0,
                  MediaQuery.of(context).size.height / 2.6 * (1 - valorx).abs(),
                )
                ..scale(valorx)
              //..rotateX(numeropage * pi * 2)
              ,
              child: Opacity(
                  opacity: opaciti, child: Image.network('$url$index/800')));
        });
  }
}
