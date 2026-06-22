import 'package:flutter/material.dart';

import '../models/produto.dart';
import 'produto_card.dart';

// Seção que exibe os produtos em uma grade com número de colunas responsivo
class AreaProdutos extends StatelessWidget {
  final List<Produto> produtos;
  final int colunas;       // quantidade de colunas da grade
  final double alturaCard; // altura fixa de cada card

  const AreaProdutos({
    super.key,
    required this.produtos,
    required this.colunas,
    required this.alturaCard,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Produtos em destaque',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 12),
        // shrinkWrap e NeverScrollableScrollPhysics permitem usar o GridView
        // dentro de um SingleChildScrollView sem conflito de scroll
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: produtos.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: colunas,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: alturaCard,
          ),
          itemBuilder: (context, index) {
            final produto = produtos[index];

            return ProdutoCard(
              icone: produto.icone,
              nome: produto.nome,
              descricao: produto.descricao,
              preco: produto.preco,
            );
          },
        ),
      ],
    );
  }
}
