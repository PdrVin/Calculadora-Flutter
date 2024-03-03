import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculadora/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final _memory = Memory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Calculadora'),
      ),
      body: Column(children: [
        _buildDisplay(),
        const Divider(height: .1, color: Colors.indigo),
        _buildTeclado(),
      ]),
    );
  }

  Widget _buildDisplay() {
    return Expanded(
        child: Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                _memory.result,
                minFontSize: 20,
                maxFontSize: 80,
                maxLines: 1,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                  fontSize: 80,
                  decoration: TextDecoration.none,
                ),
              )),
        ],
      ),
    ));
  }

  Widget _buildTecla(String text,
      {Color textColor = Colors.white,
      int flex = 1,
      bgcolor = Colors.white10}) {
    return Expanded(
      flex: flex,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _memory.applyCommand(text);
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: bgcolor, 
          shape: const CircleBorder(eccentricity: .4)
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
    );
  }

  Widget _buildTeclado() {
    return Container(
      color: Colors.black,
      height: 400,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildTecla('AC', textColor: Colors.indigo),
                _buildTecla('DEL', textColor: Colors.indigo),
                _buildTecla('%', textColor: Colors.indigo),
                _buildTecla('/', textColor: Colors.indigo),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildTecla('7'),
                _buildTecla('8'),
                _buildTecla('9'),
                _buildTecla('*', textColor: Colors.indigo),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildTecla('4'),
                _buildTecla('5'),
                _buildTecla('6'),
                _buildTecla('+', textColor: Colors.indigo),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildTecla('1'),
                _buildTecla('2'),
                _buildTecla('3'),
                _buildTecla('-', textColor: Colors.indigo),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildTecla('0', flex: 2),
                _buildTecla('.'),
                _buildTecla('=',
                    bgcolor: Colors.indigo, textColor: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

