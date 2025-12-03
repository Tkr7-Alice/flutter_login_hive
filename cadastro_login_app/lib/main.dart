import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'register_page.dart';

void main() async {
  // Garante que o Flutter está totalmente inicializado antes de rodar qualquer plugin
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa o Hive já configurado para funcionar com Flutter
  await Hive.initFlutter();

  // Abre (ou cria se não existir) a box chamada 'userBox'
  // Essa box funciona como uma pequena "tabela" local para armazenar dados
  await Hive.openBox('userBox');

  // Inicia o aplicativo Flutter
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,   // Remove a faixa "Debug" no canto da tela
      title: 'Cadastro e Login',           // Título do app
      theme: ThemeData(primarySwatch: Colors.blue), // Tema padrão azul
      home: const RegisterPage(),          // Página inicial do app (tela de cadastro)
    );
  }
}
