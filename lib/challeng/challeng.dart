import 'package:flutter/material.dart';
import 'package:wapp/animatedcontainer/containeranimed.dart';
import 'package:wapp/usosliver/usosliver.dart';
import 'package:wapp/utilidades/tarjetas.dart';

ScrollController _scrollcontroler, _scrollmenu;

class Challeng extends StatefulWidget {
  @override
  _ChallengState createState() => _ChallengState();
}

class _ChallengState extends State<Challeng> {
  void indice() {
    setState(() {});
  }

  @override
  void initState() {
    _scrollcontroler = ScrollController(debugLabel: 'fotos');
    _scrollcontroler.addListener(() {
      //   print(_scrollcontroler);
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollcontroler.removeListener(() {
      indice();
    });
    _scrollcontroler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollcontroler,
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ListTile(
                      title:
                          Image.network('${tarjetas[0].asset}/$index/640/480'),
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 75,
            child: Menu(
              height: 100,
            ),
          )
        ],
      ),
    );
  }
}

class Menu extends StatefulWidget {
  final double height;
  const Menu({Key key, this.height}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  Animation _animation;
  Offset movimiento = Offset(100, 100);
  double dy = 100;
  @override
  void initState() {
    _scrollmenu = ScrollController(debugLabel: 'menu');
    _scrollmenu.addListener(() {
      print(_scrollmenu);
    });
    _animationController =
        AnimationController(duration: Duration(milliseconds: 900), vsync: this);
    _animation = Tween(begin: 1, end: 0).animate(_animationController);
    _animationController.forward();

    print(_animationController.value);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();

    _scrollcontroler.removeListener(() {});
    _scrollmenu.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //  final scroller = _scrollcontroler.offset;

    return GestureDetector(
      onTap: () {
        setState(() {
          dy = 200;
        });
      },
      onPanUpdate: (c) {
        movimiento += (c.delta);
        dy += (dy - movimiento.dy).clamp(-1.0, 1.0);

        setState(() {
          print('dy--->$dy');
          print('ofset ${movimiento.dy}');
        });
      },
      child: AnimatedBuilder(
        animation: _animationController.view,
        builder: (BuildContext context, Widget child) {
          return Container(color: Colors.red, width: 200, height: dy);
        },
      ),
    );
  }
}
