import 'package:flutter/material.dart';

// Definição de um modelo de item de produto
class Product {
  final String name;
  final String description;
  final double price;

  Product({
    required this.name,
    required this.description,
    required this.price, required String category,
  });

  get category => null;
}

class Home extends StatelessWidget {
  final List<Product> products;

  const Home({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Catálogo de Produtos'), // Título do AppBar
        ),
        body: ListView.builder(
          itemCount: products.length, // Número de itens na lista
          itemBuilder: (context, index) {
            // Construir cada item da lista
            final product = products[index];
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  // Ícone do produto (pode ser uma imagem)
                  child: Text('${index + 1}'), // Número do item para fins de exemplo
                ),
                title: Text(product.name), // Título do produto
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.description), // Descrição do produto
                    Text('Preço: \$ ${product.price.toStringAsFixed(2)}'), // Preço do produto
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.add_shopping_cart), // Ícone para adicionar ao carrinho (exemplo)
                  onPressed: () {
                    // Adicionar a lógica para adicionar ao carrinho
                  },
                ),
                onTap: () {
                  // Adicionar a lógica para visualizar detalhes do produto
                },
              ),
            );
          },
        ),
      ),
    );
  }
}