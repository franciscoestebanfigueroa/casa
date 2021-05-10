import 'package:flutter/material.dart';
import 'package:wapp/animatedcontainer/containeranimed.dart';
import 'package:wapp/main.dart';
import 'package:wapp/movimientolibre/movimientolibre.dart';
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
                texto: ' Table es un gril \npero fijo din scroll ',
                duration: Duration(milliseconds: 2000),
                ruta: '/tabledemo'),
            Divider(),
            Botones(
                color: Colors.pink,
                texto: ' List View Reordenable',
                duration: Duration(milliseconds: 2300),
                ruta: '/reordenable'),
            Divider(),
            Botones(
                color: Colors.orange,
                texto: 'Tansition',
                duration: Duration(milliseconds: 2300),
                ruta: '/transition'),
            Divider(),
            Botones(
                color: Colors.orange,
                texto: 'CrossFade',
                duration: Duration(milliseconds: 1300),
                ruta: '/crossfade'),
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

class Reordenable extends StatefulWidget {
  const Reordenable({Key key}) : super(key: key);

  @override
  _ReordenableState createState() => _ReordenableState();
}

class _ReordenableState extends State<Reordenable> {
  Tarjetas temptarjetas;
  List<Tarjetas> milista = [
    Tarjetas('PRIMERO', 'uno', Colors.red, '${tarjetas[0].asset}/10/300'),
    Tarjetas('SEGUNDO', 'dos', Colors.orange, '${tarjetas[0].asset}/12/300'),
    Tarjetas('TERCERO', 'tres', Colors.green, '${tarjetas[0].asset}/16/300'),
    Tarjetas('CUARTO', 'cuatro', Colors.blue, '${tarjetas[0].asset}/290/300'),
    Tarjetas('QUINTO', 'cinco', Colors.yellow, '${tarjetas[0].asset}/11/300'),
    Tarjetas('SEXTO', 'seis', Colors.pink, '${tarjetas[0].asset}/19/300'),
    Tarjetas('PRIMERO', 'uno', Colors.red, '${tarjetas[0].asset}/102/300'),
    Tarjetas('SEGUNDO', 'dos', Colors.orange, '${tarjetas[0].asset}/122/300'),
    Tarjetas('TERCERO', 'tres', Colors.green, '${tarjetas[0].asset}/126/300'),
    Tarjetas('CUARTO', 'cuatro', Colors.blue, '${tarjetas[0].asset}/293/300'),
    Tarjetas('QUINTO', 'cinco', Colors.yellow, '${tarjetas[0].asset}/121/300'),
    Tarjetas('SEXTO', 'seis', Colors.pink, '${tarjetas[0].asset}/193/300')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ReorderableListView(
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              temptarjetas = milista[oldIndex];
              milista[oldIndex] = milista[newIndex - 1];
              milista[newIndex - 1] = temptarjetas;
            }
            if (oldIndex > newIndex) {
              temptarjetas = milista[oldIndex];
              milista[oldIndex] = milista[newIndex];
              milista[newIndex] = temptarjetas;
            }
          });
        },
        children: [
          for (final xxx in milista)
            ListTile(
              tileColor: xxx.color,
              key: ValueKey(xxx),
              subtitle: Text('${xxx.nombre}'),
              title: Image.network(xxx.asset),
            ),
        ],
      ),
    );
  }
}

class TransitionDemo extends StatefulWidget {
  const TransitionDemo({Key key}) : super(key: key);

  @override
  _TransitionDemoState createState() => _TransitionDemoState();
}

class _TransitionDemoState extends State<TransitionDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controleranimation;
  Animation _animation2;
  ScrollController _scrollController =
      ScrollController(initialScrollOffset: 0.0);
  @override
  void initState() {
    _controleranimation =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    //_animation2 = (Tween(end: 0.0, begin: 1.0).animate(_controleranimation));

    super.initState();
  }

  @override
  void dispose() {
    _controleranimation.dispose();
    super.dispose();
  }

  @override
  Widget _miwidget = MovimientoLibre();

  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: IconoAnimado(controleranimation: _controleranimation),
          onPressed: () {
            setState(() {
              _controleranimation.forward();
              _miwidget = FadeDemo();
            });
          },
        ),
        body: Container(
          child: Center(
            child: AnimatedSwitcher(
                duration: Duration(milliseconds: 3000),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(child: child, scale: animation);
                  //return RotationTransition(child: child, turns: animation);
                },
                child: _miwidget),
          ),
        ),
      ),
    );
  }
}

class IconoAnimado extends StatelessWidget {
  const IconoAnimado({
    Key key,
    @required AnimationController controleranimation,
  })  : _controleranimation = controleranimation,
        super(key: key);

  final AnimationController _controleranimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedIcon(
      icon: AnimatedIcons.arrow_menu,
      progress: (Tween(end: 0.0, begin: 1.0).animate(_controleranimation)),
    );
  }
}

class CrossFadeDemo extends StatefulWidget {
  CrossFadeDemo({Key key}) : super(key: key);
  bool estado = false;

  @override
  _CrossFadeDemoState createState() => _CrossFadeDemoState();
}

class _CrossFadeDemoState extends State<CrossFadeDemo> {
  @override
  Widget widgetuno = Container(
    width: 200,
    height: 200,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.red,
    ),
  );
  Widget widgetdos = Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      color: Colors.blue,
    ),
    width: 200,
    height: 200,
  );
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.place),
          onPressed: () {
            print(widget.estado);
            setState(() {
              widget.estado = !widget.estado;
            });
          },
        ),
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Colors.grey, gradient: migradiente),
          child: AnimatedCrossFade(
            duration: Duration(milliseconds: 1000),
            firstChild: widgetuno,
            secondChild: widgetdos,
            crossFadeState: widget.estado
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            layoutBuilder: (wuno, keyuno, wdos, kdos) {
              return Stack(
                overflow: Overflow.visible,
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 100,
                    child: wuno,
                    key: keyuno,
                  ),
                  Positioned(
                    top: 100,
                    key: kdos,
                    child: wdos,
                  ),
                ],
              );
            },
          ),
        ));
  }
}
