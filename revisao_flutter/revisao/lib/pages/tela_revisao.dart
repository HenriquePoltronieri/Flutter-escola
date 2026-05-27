import 'package:flutter/material.dart';

class TelaRevisao extends StatefulWidget { // Mudar de estado
  const TelaRevisao({super.key});

  @override 
  State<TelaRevisao> createState() => _TelaRevisaoState();
  //Onde fica os dados
}

class _TelaRevisaoState extends State<TelaRevisao> { //A tela que vai mudar de estado
  String mensagem = "Clique em uma opção";

  @override
  Widget build(BuildContext context) {
    return Scaffold( //Corpo da aplicação
  appBar: AppBar( //Cabeçalho
    title: const Text("Revisão Flutter"),
      ),

      body: const Center ( //Centraliza o conteúdo dentro dele
        child: Text("Conteúdo da tela"), 
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            mensagem = "Você clicou no botão flutuante";
          });
        }
        ),
    );
  }
}