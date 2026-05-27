import 'package:flutter/material.dart';

class TelaRevisao extends StatefulWidget {  // Mudar de estado
  const TelaRevisao({super.key});

  @override
  State<TelaRevisao> createState() => _TelaRevisaoState(); //Onde fica os dados
}

class _TelaRevisaoState extends State<TelaRevisao> { //A tela que vai mudar de estado
  String mensagem = "Clique em uma opção";

  @override
  Widget build(BuildContext context) {
    return Scaffold( //Corpo da aplicação


      appBar: AppBar( //Cabeçalho
        title: const Text("Revisão Flutter"),
      ),


      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
            crossAxisAlignment: CrossAxisAlignment.center, // Centraliza horizontalmente

            children: [
              const Icon(
                Icons.phone_android,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),

              const Text(
                'Revisão Flutter',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1
                ),
              ),
              const SizedBox(height: 10),

              const Text(
                'Vamos revisar widgets,layout, estilos, botões, estado e navegação.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16
                ),
              ),
              const SizedBox(height: 20,),

              Container(
                width: 320,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  'O container funciona como uma caixa. Ele pode ter largura, padding, margin, cor e bordas.',
                  textAlign: TextAlign.center,
                ),

              ),
            ],
          ),
        ),
      ),



      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            mensagem = "Você clicou no botão flutuante";
          }
        );
      },
  child: const Icon(Icons.add), // Adiciona o ícone de "+" aqui
),
    );
  }
}
