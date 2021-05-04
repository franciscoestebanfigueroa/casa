import 'package:flutter/material.dart';
import 'package:wapp/animatedcontainer/containeranimed.dart';
import 'package:wapp/usosliver/usosliver.dart';

class Challeng extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(color: Colors.green),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Stack(
                children: [Menu()],
              ),
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}

class Menu extends StatefulWidget {
  const Menu({
    Key key,
  }) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  ScrollController _scrollcontroler;
  Animation _animation;

  void indice() {
    print('_scrollcontroler.offset');
    setState(() {});
  }

  @override
  void initState() {
    _animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    _animation = Tween(begin: 1, end: 0).animate(_animationController);
    _animationController.forward();

    print(_animationController.value);
    _scrollcontroler = ScrollController();
    _scrollcontroler.addListener(() {
      indice();
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollcontroler.dispose();
    _scrollcontroler.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //  final scroller = _scrollcontroler.offset;
    double movimiento = 0;

    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          // print('valor ofsetttt${offset.delta}');
          return AnimatedPositioned(
            duration: Duration(seconds: 1),
            height: _animationController.value * size.height,
            width: size.width * 0.75,
            bottom: 0,
            left: size.width * .25 / 2,
            child: GestureDetector(
              onPanUpdate: (value) {
                setState(() {
                  movimiento = size.height;
                });
              },
              child: Container(
                color: Colors.red,
              ),
            ),
          );
        });
  }
}
