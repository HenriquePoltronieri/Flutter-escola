import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:atividade4/pages/tela_login.dart';

void main() { //inicio do programa
  runApp(
    DevicePreview( // consegui visualizar o celular
      builder: (context) => const MeuApp(),
    ),
  );
}

class MeuApp extends StatelessWidget { //tipo estático
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( //configurar app
      debugShowCheckedModeBanner: false,

      theme: ThemeData( // tema geral
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          secondary: Colors.amber,
        ),
      ),

      home: const TelaLogin(), //primeira tela do app
    );
  }
}