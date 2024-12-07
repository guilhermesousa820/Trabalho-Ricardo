import 'package:flutter/material.dart';

class Jokenpo extends StatefulWidget {
  @override
  _JokenpoState createState() => _JokenpoState();
}

class _JokenpoState extends State<Jokenpo> {
  String escolhaUsuario = "";
  String escolhaComputador = "";
  String resultado = "";

  void jogar(String escolha) {
    final opcoes = ["Pedra", "Papel", "Tesoura"];
    final escolhaComp = opcoes[(opcoes.length *
            (new DateTime.now().millisecondsSinceEpoch % 100) /
            100)
        .floor()];

    setState(() {
      escolhaUsuario = escolha;
      escolhaComputador = escolhaComp;
      if (escolha == escolhaComp) {
        resultado = "Empate!";
      } else if ((escolha == "Pedra" && escolhaComp == "Tesoura") ||
          (escolha == "Papel" && escolhaComp == "Pedra") ||
          (escolha == "Tesoura" && escolhaComp == "Papel")) {
        resultado = "Você Venceu!";
      } else {
        resultado = "Você Perdeu!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Jokenpô",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Escolha uma opção:",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => jogar("Pedra"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  child: Text(
                    "Pedra",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => jogar("Papel"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  child: Text(
                    "Papel",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => jogar("Tesoura"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  child: Text(
                    "Tesoura",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              "Sua escolha: $escolhaUsuario",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Escolha do Computador: $escolhaComputador",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              resultado,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: resultado == "Empate!"
                    ? Colors.grey
                    : (resultado == "Você Venceu!" ? Colors.green : Colors.red),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Tente novamente escolhendo outra opção.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
