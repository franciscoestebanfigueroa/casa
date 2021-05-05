import 'dart:math';

import 'package:flutter/material.dart';

class ContainerAnimed extends StatefulWidget {
  const ContainerAnimed({Key key}) : super(key: key);

  @override
  _ContainerAnimedState createState() => _ContainerAnimedState();
}

class _ContainerAnimedState extends State<ContainerAnimed>
    with TickerProviderStateMixin {
  AnimationController _controler;
  @override
  void initState() {
    _controler = AnimationController(
      reverseDuration: Duration(seconds: 2),
      vsync: this,
      duration: Duration(milliseconds: 8000),
    );
    // _controler.forward();//una sola vez
    _controler.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controler.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: AnimatedBuilder(
          animation: _controler.view,
          builder: (BuildContext context, Widget child) {
            print(_controler.value.abs());
            return Transform.rotate(
              angle: 2 * pi * _controler.value,
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                width: _controler.value * 100.0,
                height: _controler.value * 100.0,
                child: Text('Pancho'),
              ),
            );
          },
        ),
      ),
    );
  }
}
