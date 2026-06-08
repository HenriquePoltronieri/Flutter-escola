import 'package:flutter/material.dart';
import 'package:atividade4/pages/tela_home.dart';
import 'package:atividade4/pages/tela_cadastro.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final TextEditingController emailController =
      TextEditingController(); //Pega o texto digitado para o email
  final TextEditingController senhaController =
      TextEditingController(); //Pega o texto digitado para a senha

  String mensagemErro = ''; //String que vamos usar para definir erros

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.lock,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Digite seu email e senha para acessar o app.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: emailController, //Liga o campo ao controlador
                keyboardType:
                    TextInputType.emailAddress, //Define tipo de teclado
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Digite seu email', //texto dentro do campo como exemplo
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: senhaController,
                obscureText: true, //Esconde o texto digitado
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  hintText: 'Digite sua senha',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                mensagemErro,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  // ao pressionar
                  String email = emailController
                      .text; //vai definir se o usuário colocou email correto
                  String senha = senhaController
                      .text; //vai definir se o usuário colocou senha correta

                  if (email.isEmpty) {
                    //se o email estiver vazio, dá erro
                    setState(() {
                      mensagemErro = 'Digite seu email';
                    });
                  } else if (!email.contains('@')) {
                    //se o email não conter o @, dá erro
                    setState(() {
                      mensagemErro = 'Digite um email válido';
                    });
                  } else if (senha.isEmpty) {
                    // se a senha estiver vazia, dá erro
                    setState(() {
                      mensagemErro = 'Digite sua senha';
                    });
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TelaHome(),
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.login),
                label: const Text('Entrar'),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push( //leva para a tela de cadastro
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TelaCadastro(),
                    ),
                  );
                },
                child: const Text('Criar conta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}