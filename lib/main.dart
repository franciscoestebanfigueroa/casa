import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:wapp/segundapage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //  FirebaseApp defaultApp = Firebase.app();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat',
      initialRoute: '/',
      routes: {
        '/': (contex) => Sfo(),
      },
    );
  }
}

class Sfo extends StatelessWidget {
  const Sfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Center(
        child: Container(child: Pruebafire()),
      ),
    );
  }
}
