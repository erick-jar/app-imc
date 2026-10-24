
// Crie aqui a configoração do app para mostrar: seu nome objetivo do seu app

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart'; // Importante para rodar a animação

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Topo da tela de Sobre
      appBar: AppBar(
        title: const Text(
          'Sobre o Aplicativo',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white), // Deixa a setinha de voltar branca
      ),
      backgroundColor: Colors.white,
      
      // Corpo da tela com as configurações solicitadas
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 1. Apresentação do Desenvolvedor
              const Text(
                'Desenvolvido por:',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                'Seu Nome Aqui', // 👈 Substitua pelo seu nome real
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 40),

              // 2. Ícone decorativo da Mente/Foco
              const Icon(
                Icons.psychology, 
                size: 80, 
                color: Colors.green
              ),
              const SizedBox(height: 30),

              // 3. Objetivo com Texto Animado (Máquina de escrever)
              const Text(
                'Objetivo do App:',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              
              SizedBox(
                height: 120, // Espaço reservado para o bloco de texto
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Conscientizar as pessoas de que o maior inimigo delas é a si mesmas.',
                      textAlign: TextAlign.center,
                      textStyle: const TextStyle(
                        color: Colors.green,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        height: 1.4,
                      ),
                      speed: const Duration(milliseconds: 50),
                    ),
                  ],
                  totalRepeatCount: 1,
                  displayFullTextOnTap: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


