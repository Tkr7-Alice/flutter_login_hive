import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'login_page.dart';

/// Página de cadastro (RegisterPage)
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

/// Estado da RegisterPage
class _RegisterPageState extends State<RegisterPage> {
  /// Controllers para capturar o texto digitado nos inputs
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  /// Chave global para validar o formulário
  final _formKey = GlobalKey<FormState>();

  /// Abertura da Box do Hive onde vamos salvar os usuários
  /// (essa box já deve ter sido aberta no main)
  final _box = Hive.box('usersBox');

  /// Função que realiza o cadastro do usuário
  void _registerUser() {
    // Valida o formulário inteiro
    if (_formKey.currentState!.validate()) {
      final email = _emailCtrl.text.trim();     // Captura o e-mail digitado
      final password = _passCtrl.text.trim();   // Captura a senha digitada
      final name = _nameCtrl.text.trim();       // Captura o nome digitado

      // Salva no Hive: chave = email, valor = um map {name, password}
      _box.put(email, {'name': name, 'password': password});

      // Mostra uma mensagem de sucesso na tela
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuário cadastrado com sucesso!')),
      );

      // Limpa os campos depois de cadastrar
      _nameCtrl.clear();
      _emailCtrl.clear();
      _passCtrl.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'), // Título da página
      ),

      body: Padding(
        padding: const EdgeInsets.all(16), // Distância em volta do conteúdo

        // Form é o widget responsável por validação
        child: Form(
          key: _formKey,

          child: Column(
            children: [
              /// Campo de nome
              TextFormField(
                controller: _nameCtrl,
                decoration: const InputDecoration(labelText: 'Nome completo'),

                /// Valida se o campo está vazio
                validator: (v) =>
                    v!.isEmpty ? 'Por favor, insira seu nome' : null,
              ),

              /// Campo de e-mail
              TextFormField(
                controller: _emailCtrl,
                decoration: const InputDecoration(labelText: 'E-mail'),

                validator: (v) =>
                    v!.isEmpty ? 'Por favor, insira um e-mail' : null,
              ),

              /// Campo de senha
              TextFormField(
                controller: _passCtrl,
                obscureText: true, // Deixa a senha escondida
                decoration: const InputDecoration(labelText: 'Senha'),

                validator: (v) =>
                    v!.length < 4 ? 'Senha muito curta' : null,
              ),

              const SizedBox(height: 20),

              /// Botão principal – realiza o cadastro
              ElevatedButton(
                onPressed: _registerUser,
                child: const Text('Cadastrar'),
              ),

              const SizedBox(height: 20),

              /// Botão secundário – vai para a página de Login
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  );
                },
                child: const Text('Ir para Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
