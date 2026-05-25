import 'package:flutter/material.dart';
import '../widgets/card_icone.dart';
import 'tela_configuracoes.dart';
import 'tela_favoritos.dart';
import 'tela_perfil.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  String mensagem = 'Escolha uma opção para começar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu App de Ícones'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Painel Principal',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text('Escolha uma opção abaixo:'),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: Colors.purple.shade50,
              child: Text(mensagem),
            ),
            const SizedBox(height: 16),
            CardIcone(
              icone: Icons.person,
              titulo: 'Perfil',
              descricao: 'Ver informações do usuário.',
              textoBotao: 'Abrir Perfil',
              cor: Colors.purple,
              onPressed: () {
                setState(() {
                  mensagem = 'Você abriu a página Perfil';
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TelaPerfil()),
                );
              },
            ),
            CardIcone(
              icone: Icons.favorite,
              titulo: 'Favoritos',
              descricao: 'Ver seus conteúdos favoritos.',
              textoBotao: 'Ver Favoritos',
              cor: Colors.pink,
              onPressed: () {
                setState(() {
                  mensagem = 'Você abriu Favoritos';
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TelaFavoritos()),
                );
              },
            ),
            CardIcone(
              icone: Icons.settings,
              titulo: 'Configurações',
              descricao: 'Configurar o aplicativo.',
              textoBotao: 'Configurar',
              cor: Colors.teal,
              onPressed: () {
                setState(() {
                  mensagem = 'Você abriu Configurações';
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TelaConfiguracoes()),
                );
              },
            ),
            CardIcone(
              icone: Icons.notifications,
              titulo: 'Notificações',
              descricao: 'Ver avisos e novidades.',
              textoBotao: 'Abrir Modal',
              cor: Colors.orange,
              onPressed: () {
                setState(() {
                  mensagem = 'Você abriu o modal';
                });
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      height: 220,
                      child: Column(
                        children: [
                          const Icon(Icons.notifications,
                              size: 50, color: Colors.orange),
                          const SizedBox(height: 12),
                          const Text(
                            'Modal de Notificações',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          const Text('Não tem nenhuma notificação pendente.'),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Fechar'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            mensagem = 'Você clicou no botão flutuante';
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
