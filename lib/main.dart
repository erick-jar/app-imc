import 'package:flutter/material.dart';
import 'sobre.dart';
import 'calculadora.dart';
void main() {
  runApp(MaterialApp(home: Home(), debugShowCheckedModeBanner: false));
}

class Home extends StatefulWidget {
  const new({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // controladores para os campos de texto
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  // variável para o resultado da informação do IMC
  String _infoText = 'Informe seus dados!';
  // função para resetar os campos de texto e a variável de resultado

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
            ListTile(leading:Icon(Icons.calculate), 
            title: Text('Calculo IMC'), onTap: () {
              Navigator.push( 
                context,
                MaterialPageRoute(builder: (context) => const CalculadoraPage()),
                
              );
            }),
            ListTile(
              leading: Icon(Icons.info, color:Colors.green,
              // trailing: Icon(Icons.info, color:Colors.green, coloca o item a direita 
              
              ),
              title: Text('Sobre'), onTap: () {
              Navigator.push( 
                context,
                MaterialPageRoute(builder: (context) => const SobrePage()),
              );
            }),    
          ]
        )
      ),
      // barra de título
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      backgroundColor: Colors.white, // cor de fundo
      body: const Center(child: Text('Bem-vindo à Calculadora de IMC'),),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.all(0),
        child: Container(
          height: 30,
          color: Colors.green,
          child: Center(
            child: Text(
              'Desenvolvido por erick-jar',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
