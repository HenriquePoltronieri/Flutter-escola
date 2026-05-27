
import 'package:flutter/material.dart';

class CardIcone extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String descricao;
  final String textoBotao;
  final Color cor;
  final VoidCallback onPressed;

  const CardIcone({
    super.key,
    required this.icone,
    required this.titulo,
    required this.descricao,
    required this.textoBotao,
    required this.cor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: cor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icone,
                color: Colors.white,
                size: 32,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(descricao),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: onPressed,
                    child: Text(textoBotao),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
