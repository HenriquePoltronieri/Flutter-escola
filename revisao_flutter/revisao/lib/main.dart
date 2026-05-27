import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import './pages/tela_revisao.dart';

void main() { // Onde o app começa
  runApp(
    DevicePreview( // Ativa o device_preview
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget { // Estático
  const MyApp({super.key});   // Cria id para o flutter

  @override
  Widget build(BuildContext context) {
    return MaterialApp(  //Configura o app
    debugShowCheckedModeBanner: false,

      theme: ThemeData( // Define o visual
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          secondary: Colors.amber,
          ),
      ),

      home: const TelaRevisao(), // Cria primeira tela
    );
  }
}
