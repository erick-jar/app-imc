import 'package:flutter/material.dart';

class CalculadoraPage extends StatefulWidget {
  // Ajustado o nome do construtor de 'new' (que é palavra reservada) para 'CalculadoraPage'
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  // 1. Declaração dos controladores para capturar o texto dos inputs
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();

  // 2. Variável para armazenar o resultado e o texto informativo
  String _infoText = "Informe seus dados!";

  //Método para zerar o clacular o IMC
  void _resetFields() {
    pesoController.text = '';
    alturaController.text = '';
    setState(() {
      _infoText = 'Informe seus dados!';
    });
  }
  // 3. Método para calcular o IMC
  void _calculate() {
    setState(() {
      // Valida se os campos não estão vazios
      if (pesoController.text.isEmpty || alturaController.text.isEmpty) {
        _infoText = "Por favor, preencha todos os campos!";
        return;
      }

      // Converte os textos para números
      double peso = double.parse(pesoController.text);
      // Converte a altura de centímetros para metros
      double altura = double.parse(alturaController.text) / 100; 
      
      double imc = peso / (altura * altura);

      if (imc < 18.6) {
        _infoText = "Abaixo do Peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "Peso Ideal (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = "Levemente Acima do Peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
      } else {
        _infoText = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // É boa prática retornar um Scaffold para dar estrutura de página (AppBar, Body, etc.)
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: _resetFields,
            icon: Icon(Icons.refresh, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        // Removido o 'const' do Column pois os TextFields possuem controladores dinâmicos
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.person_outline, size: 120, color: Colors.green),
            
            TextField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.green, fontSize: 25),
              decoration: const InputDecoration(
                labelText: 'Peso (kg)',
                labelStyle: TextStyle(color: Colors.green),
              ),
              controller: pesoController,
            ),
            
            const SizedBox(height: 20),
            
            TextField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.green, fontSize: 25),
              decoration: const InputDecoration(
                labelText: 'Altura (cm)',
                labelStyle: TextStyle(color: Colors.green),
              ),
              controller: alturaController,
            ),
            
            const SizedBox(height: 20),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: _calculate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    "Calcular",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Texto que exibirá o resultado do IMC baseado no método _calculate
            Text(
              _infoText,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.green, fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
