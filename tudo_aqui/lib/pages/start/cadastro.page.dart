import 'package:flutter/material.dart';
import 'package:tudo_aqui/pages/start/login.page.dart';
import 'package:tudo_aqui/utils/validators.dart';
import 'package:tudo_aqui/widgets/custom.bottom.dart';
import 'package:tudo_aqui/widgets/custom.text.field.dart';
import 'package:tudo_aqui/widgets/loading.indicator.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();

  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final telefoneController = TextEditingController();
  String? tipoUsuario;

  bool _isLoading = false;

  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    senhaController.dispose();
    telefoneController.dispose();
    super.dispose();
  }

  void realizarCadastro() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (tipoUsuario == null) {
      print("Selecione um tipo de usuário!");
      return;
    }

    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    print("Cadastro realizado com sucesso!");

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
        color: const Color.fromARGB(255, 36, 54, 58),
        child: Stack(
          children: [
            ListView(
              children: <Widget>[
                const CircleAvatar(
                  radius: 60,
                  backgroundImage:
                      AssetImage("assets/images/TudoAquiAzul.jpeg"),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        label: "Nome",
                        hint: "Digite seu nome",
                        controller: nomeController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Nome é obrigatório";
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
                      CustomTextField(
                        label: "Telefone",
                        hint: "Digite seu telefone",
                        keyboardType: TextInputType.phone,
                        controller: telefoneController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Telefone é obrigatório";
                          }
                          if (!Validators.validarTelefone(value)) {
                            return "Telefone inválido";
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
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: "Tipo de Usuário",
                          labelStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        items: const [
                          DropdownMenuItem<String>(
                            value: "Cliente",
                            child: Text("Cliente",
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 20)),
                          ),
                          DropdownMenuItem<String>(
                            value: "Prestador de Serviços",
                            child: Text("Prestador de Serviços",
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 20)),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            tipoUsuario = value;
                          });
                        },
                        value: tipoUsuario,
                        validator: (value) {
                          if (value == null) {
                            return "Selecione um tipo de usuário";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        text: "Cadastrar",
                        onPressed: realizarCadastro,
                        backgroundColor: Colors.blue,
                        textColor: Colors.white,
                        borderRadius: 25,
                        padding: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (_isLoading)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: const LoadingIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
