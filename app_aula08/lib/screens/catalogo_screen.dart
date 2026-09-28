import 'package:flutter/material.dart';
import '../models/produto.dart';
import '../widgets/produto_card.dart';
import 'detalhes_produto_screen.dart'; // Import da tela do Nível 3

class CatalogoScreen extends StatefulWidget {
  const CatalogoScreen({super.key});

  @override
  State<CatalogoScreen> createState() => _CatalogoScreenState();
}

class _CatalogoScreenState extends State<CatalogoScreen> {
  // A lista não pode ser 'final' rígida com construtor constante se quisermos adicionar/remover itens.
  final List<Produto> _produtos = [
    const Produto(id: '1', nome: 'Smartphone Galaxy S24', preco: 4500.00, categoria: 'Eletrônicos', icone: '📱'),
    const Produto(id: '2', nome: 'Notebook Dell XPS', preco: 8900.00, categoria: 'Informática', icone: '💻'),
    const Produto(id: '3', nome: 'Fone Bluetooth Sony', preco: 1200.00, categoria: 'Áudio', icone: '🎧'),
    const Produto(id: '4', nome: 'Smartwatch Garmin', preco: 2300.00, categoria: 'Wearables', icone: '⌚'),
    const Produto(id: '5', nome: 'Teclado Mecânico RGB', preco: 450.00, categoria: 'Periféricos', icone: '⌨️'),
  ];

  // Desafio Nível 1: Adicionar produto usando setState
  void _adicionarProduto() {
    setState(() {
      _produtos.add(
        Produto(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          nome: 'Novo Produto Genérico',
          preco: 99.90,
          categoria: 'Diversos',
          icone: '📦',
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Produtos'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text('Itens: ${_produtos.length}', style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _produtos.length,
        itemBuilder: (context, index) {
          final produto = _produtos[index];
          return ProdutoCard(
            produto: produto,
            
            // Lógica do Nível 2 (Remoção da lista)
            onDismissed: () {
              setState(() {
                _produtos.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${produto.nome} removido!'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            
            // Desafio Nível 3: Navegação para a nova tela
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetalhesProdutoScreen(produto: produto),
                ),
              );
            },
          );
        },
      ),
      
      // Desafio Nível 1: Botão Flutuante
      floatingActionButton: FloatingActionButton(
        onPressed: _adicionarProduto,
        child: const Icon(Icons.add),
      ),
    );
  }
}