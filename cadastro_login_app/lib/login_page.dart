import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'home_page.dart';

/// Tela de Login
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

/// Estado da tela de Login
class _LoginPageState extends State<LoginPage> {
  /// Controllers para capturar o texto digitado nos campos de e-mail e senha
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  /// Chave do formulário, usada para validar os campos
  final _formKey = GlobalKey<FormState>();

  /// A box do Hive onde estão armazenados os usuários
  final _box = Hive.box('usersBox');

  /// Função responsável por validar e efetuar login
  void _loginUser() {
    // Verifica se os campos do formulário são válidos
    if (_formKey.currentState!.validate()) {
      final email = _emailCtrl.text.trim();     // Captura o e-mail sem espaços
      final password = _passCtrl.text.trim();   // Captura a senha sem espaços

      // Verifica se existe algum usuário com este e-mail cadastrado
      if (_box.containsKey(email)) {
        final userData = _box.get(email);       // Pega o mapa com {name, password}

        // Compara senha digitada com senha salva
        if (userData['password'] == password) {
          // LOGIN BEM-SUCEDIDO → Navega para a HomePage substituindo a tela atual
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => HomePage(userName: userData['name']),
            ),
          );
        } else {
          // Senha errada
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Senha incorreta!')),
          );
        }
      } else {
        // Usuário não existe
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Usuário não encontrado!')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),

      body: Padding(
        padding: const EdgeInsets.all(16),

        // Form é o widget que permite validação dos campos
        child: Form(
          key: _formKey,

          child: Column(
            children: [
              /// Campo de e-mail
              TextFormField(
                controller: _emailCtrl,
                decoration: const InputDecoration(labelText: 'E-mail'),

                // Valida se foi digitado algo
                validator: (v) =>
                    v!.isEmpty ? 'Insira seu e-mail' : null,
              ),

              /// Campo de senha
              TextFormField(
                controller: _passCtrl,
                obscureText: true, // Oculta o texto digitado (senha)
                decoration: const InputDecoration(labelText: 'Senha'),

                validator: (v) =>
                    v!.isEmpty ? 'Insira sua senha' : null,
              ),

              const SizedBox(height: 20),

              /// Botão para efetuar login
              ElevatedButton(
                onPressed: _loginUser,
                child: const Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
