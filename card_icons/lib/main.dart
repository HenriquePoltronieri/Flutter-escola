import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'pages/tela_home.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MeuApp(),
    ),
  );
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const TelaHome(),
    );
  }
}
