import 'package:flutter/material.dart';
import 'dart:math'; // Para gerar frases aleatórias

class FrasesDoDia extends StatefulWidget {
  @override
  _FrasesDoDiaState createState() => _FrasesDoDiaState();
}

class _FrasesDoDiaState extends State<FrasesDoDia> {
  String _message = "Clique abaixo para gerar uma frase!";

  List<String> messages = [
    "A vida é curta, aproveite cada momento.",
    "Sonhe grande, trabalhe duro, e o sucesso virá.",
    "A paciência é a chave para alcançar grandes resultados.",
    "O segredo da felicidade é fazer o que você ama.",
    "Não tenha medo de recomeçar, um novo começo pode ser o que você precisa.",
    "Acredite em si mesmo e todo o resto virá.",
    "A única maneira de fazer um excelente trabalho é amar o que você faz.",
    "O sucesso não é o fim, o fracasso não é fatal: o que conta é a coragem de continuar.",
    "Onde há vontade, há um caminho.",
    "A vida começa onde sua zona de conforto termina.",
    "Seja a mudança que você quer ver no mundo.",
    "Faça o que pode, com o que tem, onde está.",
    "Acredite nos seus sonhos, mesmo quando ninguém mais acreditar.",
    "Viva o momento, pois o agora é tudo o que você tem.",
    "O único lugar onde o sucesso vem antes do trabalho é no dicionário.",
    "Grandes coisas nunca vêm de zonas de conforto.",
    "O único limite para o seu sucesso é a sua imaginação.",
    "Você não precisa ser perfeito, apenas persistente.",
    "A adversidade revela o gênio, a prosperidade o esconde.",
    "Nunca desista. Grandes coisas levam tempo."
  ];

  void _generateText() {
    int i = Random().nextInt(messages.length);

    setState(() {
      _message = messages[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Frases Aleatórias",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold, // Texto em negrito no AppBar
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.fill,
                scale: 1.5,
              ),
              Padding(
                padding: EdgeInsets.only(top: 70),
                child: Text(
                  _message,
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 35),
                child: ElevatedButton(
                  onPressed: _generateText,
                  child: Text(
                    "Nova Frase",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold, // Texto em negrito
                    ),
                  ),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
