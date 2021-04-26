import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: -360,
            left: 0,
            height: 600,
            width: size.width,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(600),
                color: Colors.purple,
              ),
            ),
          ),
          Positioned(
            top: size.height / 6,
            right: (size.width / 2) - 60,
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 60,
              child: FlutterLogo(
                size: 60,
              ),
            ),
          )
        ],
      ),
    );
  }
}
