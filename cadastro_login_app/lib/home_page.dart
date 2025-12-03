import 'package:flutter/material.dart';

/// Tela inicial exibida após o login.
/// Recebe o nome do usuário para mostrar uma mensagem personalizada.
class HomePage extends StatelessWidget {
  final String userName; // Nome enviado pela tela de login

  const HomePage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior da tela com o título "Página Inicial"
      appBar: AppBar(title: const Text ('Página Inicial')),

      // Corpo da tela
      body: Center(
        // Exibe um texto centralizado com o nome do usuário
        child: Text(
          'Bem-vindo, $userName!',
          style: const TextStyle(
            fontSize: 24,              // Tamanho da fonte
            fontWeight: FontWeight.bold, // Deixa o texto em negrito
          ),
        ),
      ),
    );
  }
}

