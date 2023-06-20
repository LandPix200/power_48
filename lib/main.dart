import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_48/modules/home/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.abelTextTheme(),
      ),
    );
  }
}
