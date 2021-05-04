import 'package:flutter/material.dart';

class Challeng extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
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
  _scrollcontroler= ScrollController() 

  @override
  void initState() {
    
    _animationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: null,
    );
  }
}
