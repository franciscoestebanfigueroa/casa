import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

final delivery = ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: Colors.deepPurple, //PREFIJO LOS MIOS
        displayColor: Colors.deepPurple,
        decorationColor: Colors.deepPurple),
    iconTheme: IconThemeData(color: Colors.deepPurple));

final migradiente = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.blue, Colors.purple]);

final List<Color> coloresgradiente = [Colors.blue, Colors.deepPurple];
