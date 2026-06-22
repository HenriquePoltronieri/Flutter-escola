import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'pages/tela_responsiva.dart';

// Envolve o app com DevicePreview para simular diferentes tamanhos de tela
void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const AppResponsivo(),
    ),
  );
}

// Widget raiz do aplicativo, configurado para funcionar com o DevicePreview
class AppResponsivo extends StatelessWidget {
  const AppResponsivo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsividade',
      // Aplica o locale e o builder do DevicePreview para simular dispositivos
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const TelaResponsiva(),
    );
  }
}
