import 'package:calculadora/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const Mp());

class Mp extends StatelessWidget {
  const Mp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const Calculator(),
    );
  }
}
