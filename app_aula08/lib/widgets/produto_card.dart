import 'package:flutter/material.dart';
import '../models/produto.dart';

class ProdutoCard extends StatelessWidget {
  final Produto produto;
  final VoidCallback? onTap;
  final VoidCallback? onDismissed; // Propriedade adicionada para o Nível 2

  const ProdutoCard({
    super.key,
    required this.produto,
    this.onTap,
    this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    // Desafio Nível 2: Widget Dismissible envolvendo o Card
    return Dismissible(
      key: Key(produto.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        if (onDismissed != null) onDismissed!();
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        elevation: 2,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            child: Text(produto.icone, style: const TextStyle(fontSize: 20)),
          ),
          title: Text(produto.nome, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('Categoria: ${produto.categoria}'),
          trailing: Text(
            'R\$ ${produto.preco.toStringAsFixed(2)}',
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green, fontSize: 15),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}