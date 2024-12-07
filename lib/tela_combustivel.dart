import 'package:flutter/material.dart';

class TelaCombustivel extends StatefulWidget {
  @override
  _TelaCombustivelState createState() => _TelaCombustivelState();
}

class _TelaCombustivelState extends State<TelaCombustivel> {
  TextEditingController _alcoolController = TextEditingController();
  TextEditingController _gasolinaController = TextEditingController();
  String _resultado = "";
  String _detalhes = "";
  List<String> _historico = [];

  void _calcular() {
    try {
      double? precoAlcool =
          double.tryParse(_alcoolController.text.replaceAll(',', '.'));
      double? precoGasolina =
          double.tryParse(_gasolinaController.text.replaceAll(',', '.'));

      if (precoAlcool == null || precoGasolina == null) {
        setState(() {
          _resultado =
              "Por favor, insira valores válidos para os preços (ex.: 5,29).";
          _detalhes = "";
        });
        return;
      }

      if (precoAlcool <= 0 || precoGasolina <= 0) {
        setState(() {
          _resultado =
              "Os valores devem ser maiores que zero. Por favor, corrija.";
          _detalhes = "";
        });
        return;
      }

      double proporcao = precoAlcool / precoGasolina;

      if (proporcao <= 0.7) {
        _resultado = "Abasteça com Álcool!";
        _detalhes =
            "O álcool é mais econômico. Relação: ${(proporcao * 100).toStringAsFixed(1)}% (abaixo de 70%).";
      } else {
        _resultado = "Abasteça com Gasolina!";
        _detalhes =
            "A gasolina é mais econômica. Relação: ${(proporcao * 100).toStringAsFixed(1)}% (acima de 70%).";
      }

      // Adiciona ao histórico
      setState(() {
        _historico.insert(
          0,
          "Álcool: R\$${precoAlcool.toStringAsFixed(2)}, Gasolina: R\$${precoGasolina.toStringAsFixed(2)} → $_resultado",
        );
      });
    } catch (e) {
      setState(() {
        _resultado = "Erro inesperado: ${e.toString()}";
        _detalhes = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Escolha do Combustível",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Calculadora de Economia",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _alcoolController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: "Preço do Álcool (ex.: 4,19)",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _gasolinaController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: "Preço da Gasolina (ex.: 5,29)",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _calcular,
                child: Text("Calcular"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.green,
                ),
              ),
              SizedBox(height: 16),
              Text(
                _resultado,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 8),
              Text(
                _detalhes,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 24),
              Divider(color: Colors.grey),
              Text(
                "Histórico de Cálculos",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 8),
              _historico.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: _historico.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            _historico[index],
                            style: TextStyle(fontSize: 14),
                          ),
                          leading: Icon(
                            Icons.history,
                            color: Colors.grey,
                          ),
                        );
                      },
                    )
                  : Text(
                      "Nenhum cálculo realizado ainda.",
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
