import 'package:flutter/material.dart';
import 'package:atividade4/pages/tela_home.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final TextEditingController nomeController =
      TextEditingController(); //Pega o texto digitado para o nome
  final TextEditingController emailController =
      TextEditingController(); //Pega o texto digitado para o email
  final TextEditingController senhaController =
      TextEditingController(); //Pega o texto digitado para a senha
  final TextEditingController confirmarSenhaController =
      TextEditingController(); //Pega o texto digitado para confirmar senha

  String mensagem = ''; //String que vamos usar para definir erros ou sucesso
  bool sucesso = false; //controla se a mensagem é de sucesso ou erro

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.person_add,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),
              const Text(
                'Criar Conta',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: nomeController, //Liga o campo ao controlador
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  hintText: 'Digite seu nome', //texto dentro do campo como exemplo
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: emailController,
                keyboardType:
                    TextInputType.emailAddress, //Define tipo de teclado
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Digite seu email',
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
              TextField(
                controller: confirmarSenhaController,
                obscureText: true, //Esconde o texto digitado
                decoration: const InputDecoration(
                  labelText: 'Confirmar Senha',
                  hintText: 'Confirme sua senha',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock_outline),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                mensagem,
                style: TextStyle(
                  color: sucesso ? Colors.green : Colors.red, //verde se sucesso, vermelho se erro
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  // ao pressionar
                  String nome = nomeController.text;
                  String email = emailController.text;
                  String senha = senhaController.text;
                  String confirmarSenha = confirmarSenhaController.text;

                  if (nome.isEmpty) {
                    //se o nome estiver vazio, dá erro
                    setState(() {
                      sucesso = false;
                      mensagem = 'Digite seu nome';
                    });
                  } else if (email.isEmpty) {
                    //se o email estiver vazio, dá erro
                    setState(() {
                      sucesso = false;
                      mensagem = 'Digite seu email';
                    });
                  } else if (!email.contains('@')) {
                    //se o email não conter o @, dá erro
                    setState(() {
                      sucesso = false;
                      mensagem = 'Digite um email válido';
                    });
                  } else if (senha.isEmpty) {
                    // se a senha estiver vazia, dá erro
                    setState(() {
                      sucesso = false;
                      mensagem = 'Digite sua senha';
                    });
                  } else if (senha.length < 6) {
                    // se a senha tiver menos de 6 caracteres, dá erro
                    setState(() {
                      sucesso = false;
                      mensagem = 'A senha precisa ter pelo menos 6 caracteres';
                    });
                  } else if (confirmarSenha != senha) {
                    // se a confirmação de senha for diferente, dá erro
                    setState(() {
                      sucesso = false;
                      mensagem = 'As senhas não são iguais';
                    });
                  } else {
                    setState(() {
                      sucesso = true;
                      mensagem = 'Cadastro realizado com sucesso!';
                    });
                    Navigator.push( //leva para a tela home
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TelaHome(),
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.check),
                label: const Text('Cadastrar'),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); //volta para a tela de login
                },
                child: const Text('Voltar para Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}