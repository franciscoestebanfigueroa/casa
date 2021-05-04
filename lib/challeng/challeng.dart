import 'package:flutter/material.dart';
import 'package:wapp/animatedcontainer/containeranimed.dart';
import 'package:wapp/usosliver/usosliver.dart';
import 'package:wapp/utilidades/tarjetas.dart';

ScrollController _scrollcontroler;

class Challeng extends StatefulWidget {
  @override
  _ChallengState createState() => _ChallengState();
}

class _ChallengState extends State<Challeng> {
  void indice() {
    print(_scrollcontroler);
    setState(() {});
  }

  @override
  void initState() {
    _scrollcontroler = ScrollController();
    _scrollcontroler.addListener(() {
      indice();
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
      body: Material(
        child: Stack(
          children: [
            CustomScrollView(
              controller: _scrollcontroler,
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return ListTile(
                        title: Image.network(
                            '${tarjetas[0].asset}/$index/640/480'),
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: Menu(
                    height: _scrollcontroler.offset,
                  ),
                ),
              ],
            ),
          ],
        ),
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

  @override
  void initState() {
    _animationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    _animation = Tween(begin: 1, end: 0).animate(_animationController);
    _animationController.forward();

    print(_animationController.value);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //  final scroller = _scrollcontroler.offset;
    Offset movimiento = Offset(0, 100);

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: widget.height,
      width: 200,
      color: Colors.red,
    );
  }
}
