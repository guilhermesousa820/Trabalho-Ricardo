// TelaJogos.dart

import 'package:flutter/material.dart';
import 'jokenpo.dart'; // Importando a tela do Jogo 1: Jokenpô
import 'jogo_CaraCoroa.dart'; // Importando a tela do Jogo 2: Cara ou Coroa
import 'jogosParouImpar.dart'; // Importando a tela do Jogo 3: Par ou Ímpar

void main() {
  runApp(CaraOuCoroaApp());
}

class CaraOuCoroaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo Cara ou Coroa!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TelaJogos(), // Tela inicial de escolha dos jogos
    );
  }
}

class TelaJogos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tela de Jogos",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Escolha um Jogo para Jogar:",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // Botão para Jogo 1: Jokenpô
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Jokenpo()),
                );
              },
              child: Text(
                "Jogo 1: Jokenpô",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.orange, // Cor do botão
              ),
            ),
            SizedBox(height: 16),
            // Botão para Jogo 2: Cara ou Coroa
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CaraOuCoroaScreen()),
                );
              },
              child: Text(
                "Jogo 2: Cara ou Coroa",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.green, // Cor do botão
              ),
            ),
            SizedBox(height: 16),
            // Botão para Jogo 3: Par ou Ímpar
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          JogosParOuImparScreen()), // Corrigido para o nome correto da tela
                );
              },
              child: Text(
                "Jogo 3: Par ou Ímpar",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.blue, // Cor do botão
              ),
            ),
          ],
        ),
      ),
    );
  }
}
