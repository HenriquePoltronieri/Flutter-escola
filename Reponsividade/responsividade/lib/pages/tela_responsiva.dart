import 'package:flutter/material.dart';

import '../models/produto.dart';
import '../widgets/area_produtos.dart';
import '../widgets/resumo_pedido.dart';

class TelaResponsiva extends StatelessWidget {
  const TelaResponsiva({super.key});

  @override
  Widget build(BuildContext context) {
    // Captura a largura atual da tela para exibir no texto informativo
    final larguraTela = MediaQuery.of(context).size.width;

    // Lista de produtos exibidos na grade
    final produtos = [
      Produto(Icons.laptop_mac, 'Notebook Pro',
          'Ideal para estudos e trabalho.', 'R\$ 3.499'),
      Produto(
          Icons.mouse, 'Mouse Gamer', 'Alta precisão para jogos.', 'R\$ 129'),
      Produto(Icons.keyboard, 'Teclado Mecânico', 'Conforto para digitação.',
          'R\$ 249'),
      Produto(Icons.desktop_windows, 'Monitor 24"', 'Boa imagem para aulas.',
          'R\$ 899'),
      Produto(
          Icons.headphones, 'Headset', 'Áudio limpo para chamadas.', 'R\$ 199'),
      Produto(Icons.chair, 'Cadeira Office', 'Mais conforto para estudar.',
          'R\$ 699'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Aula de Responsividade'),
        centerTitle: true,
      ),
      // LayoutBuilder fornece as constraints reais do espaço disponível
      body: LayoutBuilder(
        builder: (context, constraints) {
          final largura = constraints.maxWidth;

          // Breakpoints que definem o tipo de dispositivo
          final celular = largura < 600;
          final tablet = largura >= 600 && largura < 900;
          final desktop = largura >= 900;

          // Número de colunas da grade de produtos varia conforme o dispositivo
          final colunas = celular
              ? 1
              : tablet
                  ? 2
                  : 3;

          // Altura dos cards ajustada para cada tamanho de tela
          final alturaCard = celular
              ? 230.0
              : tablet
                  ? 220.0
                  : 210.0;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Indica visualmente qual modo de layout está ativo
                Text(
                  celular
                      ? 'Modo celular'
                      : tablet
                          ? 'Modo tablet'
                          : 'Modo desktop',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Largura atual: ${larguraTela.toStringAsFixed(0)} px'),
                const SizedBox(height: 20),
                // Banner com proporção diferente entre celular e telas maiores
                AspectRatio(
                  aspectRatio: celular ? 16 / 9 : 16 / 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Center(
                      child: FittedBox(
                        child: Text(
                          'Tech Store Responsiva',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Categorias',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                // Wrap organiza os chips automaticamente em múltiplas linhas
                const Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    Chip(label: Text('Notebook')),
                    Chip(label: Text('Mouse')),
                    Chip(label: Text('Teclado')),
                    Chip(label: Text('Monitor')),
                    Chip(label: Text('Headset')),
                    Chip(label: Text('Promoções')),
                  ],
                ),
                const SizedBox(height: 25),
                // No desktop, produtos e resumo ficam lado a lado; nos demais, empilhados
                if (desktop)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: AreaProdutos(
                          produtos: produtos,
                          colunas: colunas,
                          alturaCard: alturaCard,
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Expanded(
                        flex: 1,
                        child: ResumoPedido(),
                      ),
                    ],
                  )
                else
                  Column(
                    children: [
                      AreaProdutos(
                        produtos: produtos,
                        colunas: colunas,
                        alturaCard: alturaCard,
                      ),
                      const SizedBox(height: 20),
                      const ResumoPedido(),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
