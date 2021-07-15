import 'package:flutter/material.dart';
import 'package:flutter_redline_web2/home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RedLine Software',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        textTheme: GoogleFonts.promptTextTheme(
          Theme.of(context).textTheme,
        ),
        canvasColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}
