import 'package:flutter/material.dart';
import 'package:tudo_aqui/pages/start/cadastro.page.dart';
import 'package:tudo_aqui/utils/validators.dart';
import 'package:tudo_aqui/widgets/custom.bottom.dart';
import 'package:tudo_aqui/widgets/custom.text.field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final senhaController = TextEditingController();

    void realizarLogin() {
      final email = emailController.text;
      final senha = senhaController.text;

      if (Validators.validarEmail(email) && Validators.validarSenha(senha)) {
        print("Login realizado com sucesso!");
        // lógica para autenticar o usuário
      } else {
        print("Email ou senha inválidos!");
      }
    }

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
        color: const Color.fromARGB(255, 36, 54, 58),
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 300,
              height: 300,
              child: Image.asset("assets/images/TudoAquiLogo-removebg-preview.png"),
            ),
            const SizedBox(height: 20),

            CustomTextField(
              label: "E-mail",
              hint: "Digite seu e-mail",
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "E-mail é obrigatório";
                }
                if (!Validators.validarEmail(value)) {
                  return "E-mail inválido";
                }
                return null;
              },
              labelStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),

            CustomTextField(
              label: "Senha",
              hint: "Digite sua senha",
              obscureText: true,
              controller: senhaController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Senha é obrigatória";
                }
                if (!Validators.validarSenha(value)) {
                  return "Senha deve ter pelo menos 6 caracteres, 1 letra e 1 número";
                }
                return null;
              },
              labelStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),

            TextButton(
              onPressed: () {
                print("Recuperar senha clicado!");
              },
              child: const Text(
                "Recuperar Senha",
                style: TextStyle(color: Colors.blueGrey),
              ),
            ),
            const SizedBox(height: 20),

            CustomButton(
              text: "Login",
              onPressed: realizarLogin,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              borderRadius: 25,
              padding: 16,
            ),
            const SizedBox(height: 20),

            CustomButton(
              text: "Cadastre-se",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CadastroPage()),
                );
              },
              backgroundColor: Colors.green,
              textColor: Colors.white,
              borderRadius: 25,
              padding: 16,
            ),
          ],
        ),
      ),
    );
  }
}