import 'package:flutter/material.dart';
import 'screens/cuidadores_pages.dart';

void main() {
  runApp(const AmigoPetApp());
}

class AmigoPetApp extends StatelessWidget {
  const AmigoPetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AmigoPet',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5B8CFF),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F9FC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF5B8CFF),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
        ),
      ),
      home: const CuidadoresPage(),
    );
  }
}