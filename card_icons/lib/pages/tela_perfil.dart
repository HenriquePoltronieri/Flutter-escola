import 'package:flutter/material.dart';

class TelaPerfil extends StatelessWidget {
  const TelaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.person,
              size: 90,
              color: Colors.deepPurple,
            ),
            const SizedBox(height: 16),
            const Text(
              'Página de Perfil',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Aqui ficam informações importantes do usuário.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const ListTile(
              leading: Icon(Icons.school),
              title: Text('Estudos'),
              subtitle: Text('Aprendendo Flutter e programação'),
            ),
            Divider(),
            const ListTile(
              leading: Icon(Icons.games),
              title: Text('Jogos'),
              subtitle: Text('Jogos favoritos e plataformas'),
            ),
            Divider(),
            const ListTile(
              leading: Icon(Icons.music_note),
              title: Text('Músicas'),
              subtitle: Text('Playlist favorita para estudar '),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
