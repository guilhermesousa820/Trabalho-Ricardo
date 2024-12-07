import 'dart:math';
import 'package:flutter/material.dart';

class CaraOuCoroaScreen extends StatefulWidget {
  @override
  _CaraOuCoroaScreenState createState() => _CaraOuCoroaScreenState();
}

class _CaraOuCoroaScreenState extends State<CaraOuCoroaScreen> {
  String _escolhaJogador = '';
  String _escolhaMaquina = '';
  String _resultado = '';
  String _imagemJogador = '';
  String _imagemMaquina = '';
  String _detalheEscolhaJogador = '';
  String _detalheEscolhaMaquina = '';

  String sorteioMoeda() {
    var random = Random();
    int resultado = random.nextInt(2);
    return resultado == 0 ? 'cara' : 'coroa';
  }

  void jogar(String escolha) {
    setState(() {
      _escolhaJogador = escolha;
      _escolhaMaquina = sorteioMoeda();
      while (_escolhaJogador == _escolhaMaquina) {
        _escolhaMaquina = sorteioMoeda();
      }

      _imagemJogador = escolha == 'cara'
          ? 'assets/images/moedaCara.png'
          : 'assets/images/moedaCoroa.png';
      _imagemMaquina = _escolhaMaquina == 'cara'
          ? 'assets/images/moedaCara.png'
          : 'assets/images/moedaCoroa.png';

      _detalheEscolhaJogador = _escolhaJogador == 'cara'
          ? 'Você escolheu: Cara'
          : 'Você escolheu: Coroa';
      _detalheEscolhaMaquina = _escolhaMaquina == 'cara'
          ? 'A máquina escolheu: Cara'
          : 'A máquina escolheu: Coroa';

      var random = Random();
      if (random.nextBool()) {
        _resultado = 'Você ganhou!';
      } else {
        _resultado = 'A máquina ganhou! Tente novamente.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Jogo Cara ou Coroa',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green, // AppBar verde
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _escolhaJogador.isEmpty
                  ? Image.asset(
                      'assets/images/logoJogocouc.png',
                      width: 200,
                      height: 200,
                    )
                  : SizedBox(),
              SizedBox(height: 20),
              Text(
                _detalheEscolhaJogador,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _imagemJogador.isNotEmpty
                  ? Image.asset(_imagemJogador, width: 150, height: 150)
                  : SizedBox(),
              SizedBox(height: 20),
              Text(
                _detalheEscolhaMaquina,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _imagemMaquina.isNotEmpty
                  ? Image.asset(_imagemMaquina, width: 150, height: 150)
                  : SizedBox(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => jogar('cara'),
                    child: Text(
                      'Cara',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white, // Texto branco
                        fontWeight: FontWeight.bold, // Texto em negrito
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      backgroundColor: Colors.blue, // Cor do botão
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () => jogar('coroa'),
                    child: Text(
                      'Coroa',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white, // Texto branco
                        fontWeight: FontWeight.bold, // Texto em negrito
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      backgroundColor: Colors.red, // Cor do botão
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                _resultado,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
