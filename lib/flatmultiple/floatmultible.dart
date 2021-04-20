import 'package:flutter/material.dart';

class CircularButtonFlating extends StatelessWidget {
  const CircularButtonFlating({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(),
      body: CFB(),
    );
  }
}

class CFB extends StatelessWidget {
  const CFB({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 30,
          right: 30,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              //borderRadius: BorderRadius.circular(100),
            ),
            //height: 50,
            //swidth: 50,
            child: IconButton(
              icon: Icon(
                Icons.camera,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {
                print('Hola');
              },
            ),
          ),
        ),
      ],
    );
  }
}
