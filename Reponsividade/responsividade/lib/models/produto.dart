import 'package:flutter/material.dart';

// Modelo que representa um produto exibido na loja
class Produto {
  final IconData icone;
  final String nome;
  final String descricao;
  final String preco;

  Produto(
    this.icone,
    this.nome,
    this.descricao,
    this.preco,
  );
}
