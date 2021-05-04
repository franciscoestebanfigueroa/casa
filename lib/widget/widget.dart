import 'package:flutter/material.dart';
import 'package:wapp/main.dart';
import 'package:wapp/utilidades/tarjetas.dart';
import 'package:wapp/utilidades/temas.dart';

class WidgetTodos extends StatelessWidget {
  const WidgetTodos({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        minimum: EdgeInsets.all(20),
        child: Wrap(
          children: [
            Botones(
                texto: ' OpacityAnimation',
                duration: Duration(milliseconds: 1400),
                ruta: '/opacityanimation'),
            Divider(),
            Botones(
                texto: ' Fade Transition',
                duration: Duration(milliseconds: 2000),
                ruta: '/fadedemo'),
            Divider(),
            Botones(
                texto: ' Page con controler..',
                duration: Duration(milliseconds: 2000),
                ruta: '/pagedemo'),
            Divider(),
            Botones(
                color: Colors.pink,
                texto: ' Table es un gril pero fijo din scroll',
                duration: Duration(milliseconds: 2000),
                ruta: '/tabledemo'),
            Divider(),
          ],
        ),
      ),
    );
  }
}

class OpacityDemo extends StatefulWidget {
  const OpacityDemo({Key key}) : super(key: key);

  @override
  _OpacityDemoState createState() => _OpacityDemoState();
}

class _OpacityDemoState extends State<OpacityDemo> {
  double valueslider = 0.5;
  int valuehight = 100;
  double opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
        ),
        color: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          setState(() {
            for (opacity = 0.99; opacity < 1.0; opacity++) return;
          });
        },
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(gradient: migradiente),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Wrap(
                  verticalDirection: VerticalDirection.up,
                  spacing: 10,
                  runSpacing: 10,
                  runAlignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  children: [
                    for (int i = 0; i < tarjetas.length; i++)
                      AnimatedOpacity(
                          duration: Duration(milliseconds: valuehight * i),
                          opacity: opacity,
                          child:
                              Image.network('${tarjetas[i].asset}/$i/100/100')),
                  ],
                ),
              ),
              /*  Slider(
                  value: valueslider,
                  max: 1000,
                  onChanged: (value) {
                    setState(() {
                      valueslider = value.toDouble();
                      print(opacity);
                      valuehight = (valueslider).toInt();
                      print(valueslider / 1000);
                    });
                  })
           */
            ],
          ),
        ),
      ),
    );
  }
}

class FadeDemo extends StatefulWidget {
  FadeDemo({Key key}) : super(key: key);

  @override
  _FadeDemoState createState() => _FadeDemoState();
}

class _FadeDemoState extends State<FadeDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Scaffold(
      appBar: AppBar(),
      body: DecoratedBox(
        decoration: BoxDecoration(gradient: migradiente),
        child: Center(
          child: FadeTransition(
              opacity: _animation,
              child: Image.network('${tarjetas[0].asset}/10/800')),
        ),
      ),
    );
  }
}

class PageDemo extends StatefulWidget {
  const PageDemo({Key key}) : super(key: key);

  @override
  _PageDemoState createState() => _PageDemoState();
}

class _PageDemoState extends State<PageDemo> {
  final _controloerpage = PageController(
      initialPage: 1,
      viewportFraction: 0.9,
      keepPage: true); //lo usamos siempre..

  @override
  void initState() {
    //_controloerpage = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controloerpage,
      children: <Widget>[FadeDemo(), OpacityDemo()],
    );
  }
}

class TableDemo extends StatelessWidget {
  const TableDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: migradiente),
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Center(
            child: Table(
              border: TableBorder.all(width: 10),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: {
                // 0: FractionColumnWidth(.5),
                // 1: FractionColumnWidth(.5),
                // 2: FractionColumnWidth(.1),
              },
              children: [
                TableRow(
                    decoration: BoxDecoration(gradient: migradiente),
                    children: [
                      Container(
                        width: 50,
                        height: 250,
                        color: Colors.green,
                      ),
                      Container(
                        width: 50,
                        height: 300,
                        color: Colors.red,
                      ),
                      Image.network('${tarjetas[0].asset}/10/100/100'),

                      // for (int i = 0; i < tarjetas.length; i++)
                      Image.network('${tarjetas[0].asset}/10/400/200'),
                    ]),
                TableRow(children: [
                  Image.network('${tarjetas[0].asset}/10/400/300'),
                  Image.network('${tarjetas[0].asset}/15/400/400'),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.orange,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.orange,
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
