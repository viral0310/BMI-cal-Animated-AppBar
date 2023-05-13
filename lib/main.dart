import 'package:bmi_calc/screens/home%20page.dart';
import 'package:flutter/material.dart';
import 'bmi/input_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(primary: Color(0xff090e21))),
      initialRoute: '/input',
      routes: {
        '/': (context) => HomePage(),
        '/input': (context) => InputPage(),
      },
    ),
  );
}
