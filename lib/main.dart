import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(MaterialApp(home: Home(), debugShowCheckedModeBanner: false));
}


class Home extends StatefulWidget {
  const Home({super.key}); 

  @override
  State<Home> createState() => _HomeState(); 
}
class _HomeState extends State<Home> {

  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  String _infoText = 'Informe seus dados!';

  void _resetFields(){
    pesoController.text = '';
    alturaController.text = '';
    setState((){
      _infoText = 'Informe seus dados!';
    });
  }
  void _calculate() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;
      double imc = peso / (altura * altura);
      if (imc < 18.6) {
        _infoText = 'Abaixo do peso (${imc.toStringAsPrecision(4)})';
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = 'Peso ideal (${imc.toStringAsPrecision(4)})';
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = 'Levemente acima do peso (${imc.toStringAsPrecision(4)})';
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = 'Obesidade grau I (${imc.toStringAsPrecision(4)})';
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = 'Obesidade grau II (${imc.toStringAsPrecision(4)})';
      } else if (imc >= 40) {
        _infoText = 'Obesidade grau III (${imc.toStringAsPrecision(4)})';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // opções de menu superior
      drawer: Drawer (
        child: ListView(
          children:[
            DrawerHeader( 
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
           
          ]
        )
      ),
      appBar: AppBar(
        title: const Text(
          'Calculadora de IMC',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), 
        ),
        backgroundColor: Colors.green, 
        centerTitle: true, 
        //butão reset
        actions: [
          IconButton(
            onPressed: _resetFields, 
            icon: const Icon(Icons.refresh, color: Colors.white), 
          ),
        ],
      ),
      backgroundColor: Colors.white, 
      
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0), 
        
        
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
              controller:pesoController,
            ),
            
            
            const SizedBox(
              height: 20,
            ),
            
            
            TextField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center, 
              style: const TextStyle(color: Colors.green, fontSize: 25), 
              decoration: const InputDecoration(
                labelText: 'Altura (cm)', 
                labelStyle: TextStyle(color: Colors.green),
              ),
              controller:alturaController,
            ),
            
            const SizedBox(
              height: 20,
            ),
            
            
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
                    'Calcular',
                    style: TextStyle(color: Colors.white, fontSize: 25), 
                  ),
                ),
              ),
            ),
            
            const SizedBox(
              height: 20,
            ),
            
            Text(
              _infoText,
              textAlign: TextAlign.center, 
              style: TextStyle(color: Colors.green, fontSize: 25), 
            ),
            Row( mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    const SizedBox(width: 20.0, height: 100.0),
    const Text(
      'Be',
      style: TextStyle(fontSize: 43.0),
    ),
    const SizedBox(width: 20.0, height: 100.0),
    DefaultTextStyle(
      style: const TextStyle(
        fontSize: 40.0,
        fontFamily: 'Horizon',
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          RotateAnimatedText('AWESOME'),
          RotateAnimatedText('OPTIMISTIC'),
          RotateAnimatedText('DIFFERENT'),
        ],
        onTap: () {
          print("Tap Event");
        },
      ),
    ),
  ],
)
          ]
        ), 
      ), 
      bottomNavigationBar: const BottomAppBar(
        padding: EdgeInsets.all(0),
  color: Colors.green, 
  height: 30.0,       
  child: Center(       
    child: Text(
      'Erick-jar', 
      style: TextStyle(
        fontSize: 18, 
        color: Colors.white, // Fonte branca para dar contraste com o fundo verde
        fontWeight: FontWeight.w500,
      ), 
      textAlign: TextAlign.center,
    ),
  ),
),
    ); 
  }
}
