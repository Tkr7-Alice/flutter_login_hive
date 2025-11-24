# 📱 Flutter Login + Hive
Sistema completo de **Cadastro e Login Offline** utilizando **Flutter + Hive** como banco de dados local.  
Ideal para estudos, portfólio e aplicações que precisam funcionar sem internet.

---

## 🚀 Tecnologias utilizadas

- **Flutter** (SDK)
- **Dart**
- **Hive** (armazenamento local NoSQL)
- **Hive Flutter Adapter**
- **Material Design**

---

## 📸 Demonstração do App

> Adicione aqui suas imagens após subir no GitHub:

/assets/screenshots/login.png
/assets/screenshots/register.png
/assets/screenshots/home.png

yaml
Copiar código

- Tela de Cadastro  
- Tela de Login  
- Tela Home

---

## 📁 Estrutura de Pastas

lib/
├── main.dart
├── login_page.dart
├── register_page.dart
└── home_page.dart

yaml
Copiar código

---

## 🧠 Funcionalidades

✔ Cadastro de usuário (nome, e-mail e senha)  
✔ Armazenamento local usando Hive  
✔ Login validando senha  
✔ Puxar nome do usuário na Home  
✔ Navegação entre telas  
✔ Sem internet  
✔ Rápido e seguro  

---

## 🛠 Como rodar o projeto

### 1️⃣ Clonar o repositório

```sh
git clone https://github.com/Tkr7-Alice/flutter_login_hive.git
2️⃣ Acessar a pasta
sh
Copiar código
cd flutter_login_hive
3️⃣ Instalar dependências
sh
Copiar código
flutter pub get
4️⃣ Rodar o app
sh
Copiar código
flutter run
🧰 Dependências principais
Adicionadas automaticamente no pubspec.yaml:

yaml
Copiar código
dependencies:
  flutter:
    sdk: flutter
  hive: ^2.2.3
  hive_flutter: ^1.1.0
🗃 Banco de Dados Hive
O app utiliza uma box chamada:

nginx
Copiar código
usersBox
E salva o usuário no formato:

json
Copiar código
{
  "name": "Thomas",
  "password": "1234"
}
📌 Próximas melhorias (opcional)
Criptografar senhas

Implementar tema escuro

Validação avançada de formulário

Logout na HomePage

Tela de perfil

Uso de Hive Adapters personalizados

🤝 Contribuições
Contribuições são bem-vindas!
Sinta-se livre para abrir Issues ou enviar Pull Requests.

📄 Licença
Este projeto está sob a licença MIT — use como quiser.

👨‍💻 Autor
Thomas Kirmeier (Tkr7-Alice)
Desenvolvedor Flutter | Estudante de TI

LinkedIn: https://www.linkedin.com/in/thomas-kirmeier
GitHub: https://github.com/Tkr7-Alice
