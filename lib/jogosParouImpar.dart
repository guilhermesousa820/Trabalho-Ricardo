import 'dart:math';
import 'package:flutter/material.dart';

class JogosParOuImparScreen extends StatefulWidget {
  @override
  _JogosParOuImparScreenState createState() => _JogosParOuImparScreenState();
}

class _JogosParOuImparScreenState extends State<JogosParOuImparScreen> {
  int? _userChoice;
  int? _machineChoice;
  String _result = '';
  String _userPick = '';

  void _playGame(int userChoice) {
    Random random = Random();
    _machineChoice = random.nextInt(3) + 1;

    setState(() {
      _userChoice = userChoice;

      int sum = _userChoice! + _machineChoice!;

      bool isSumEven = sum % 2 == 0; // Soma par

      if (_userPick == 'Par' && isSumEven) {
        _result =
            'Você escolheu $_userChoice e a máquina escolheu $_machineChoice. Soma: $sum. Resultado: Par! Você ganhou!';
      } else if (_userPick == 'Ímpar' && !isSumEven) {
        _result =
            'Você escolheu $_userChoice e a máquina escolheu $_machineChoice. Soma: $sum. Resultado: Ímpar! Você ganhou!';
      } else {
        _result =
            'Você escolheu $_userChoice e a máquina escolheu $_machineChoice. Soma: $sum. Resultado: ${isSumEven ? "Par" : "Ímpar"}! A máquina ganhou!';
      }
    });
  }

  void _setUserPick(String pick) {
    setState(() {
      _userPick = pick;
      _result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green, // Cor da AppBar
        title: Text(
          'Jogo de Par ou Ímpar',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Texto em negrito
            color: Colors.white, // Cor do texto
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Primeiro, escolha Par ou Ímpar:',
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Cor de fundo do botão
                    minimumSize: Size(120, 60), // Tamanho maior
                  ),
                  onPressed: () => _setUserPick('Par'),
                  child: Text(
                    'Par',
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // Texto em negrito
                      color: Colors.white, // Cor do texto
                    ),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Cor de fundo do botão
                    minimumSize: Size(120, 60), // Tamanho maior
                  ),
                  onPressed: () => _setUserPick('Ímpar'),
                  child: Text(
                    'Ímpar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // Texto em negrito
                      color: Colors.white, // Cor do texto
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            _userPick.isEmpty
                ? Container()
                : Text(
                    'Agora, escolha um número entre 1 e 3:',
                    style: TextStyle(fontSize: 20),
                  ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _userPick.isNotEmpty ? () => _playGame(1) : null,
                  child: Container(
                    width: 80,
                    height: 80,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: Text(
                      '1',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: _userPick.isNotEmpty ? () => _playGame(2) : null,
                  child: Container(
                    width: 80,
                    height: 80,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: Text(
                      '2',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: _userPick.isNotEmpty ? () => _playGame(3) : null,
                  child: Container(
                    width: 80,
                    height: 80,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: Text(
                      '3',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            _userChoice == null
                ? Container()
                : Text(
                    _result,
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
          ],
        ),
      ),
    );
  }
}
