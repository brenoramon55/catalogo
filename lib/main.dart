import 'package:flutter/material.dart'; // Importação do pacote Flutter
import 'package:curved_navigation_bar/curved_navigation_bar.dart'; // Importação do pacote de navegação curva
import './home/home.dart'; // Importação de um arquivo local chamado home.dart

// Definição da classe Product para representar um produto
class Product {
  final String name; // Nome do produto
  final String description; // Descrição do produto
  final double price; // Preço do produto
  final String category; // Categoria do produto

  // Construtor da classe Product
  Product({required this.name, required this.description, required this.price, required this.category});
}

// Função principal que é chamada primeiro ao executar o aplicativo
void main() {
  final List<Product> productList = [
    Product(
      name: 'Nike Air Max',
      description: 'Tênis de corrida para homens',
      price: 189.99,
      category: 'Sapatos',
    ),
    Product(
      name: 'Adidas Superstar',
      description: 'Tênis clássico para uso diário',
      price: 99.99,
      category: 'Sapatos',
    ),
    Product(
      name: 'Polo Ralph Lauren',
      description: 'Camiseta de algodão de manga curta',
      price: 49.99,
      category: 'Camisetas',
    ),
    Product(
      name: 'Tommy Hilfiger',
      description: 'Camiseta polo de algodão',
      price: 69.99,
      category: 'Camisetas',
    ),
    // Adicionando mais produtos
    Product(
      name: 'Vans Old Skool',
      description: 'Tênis de skate clássico',
      price: 79.99,
      category: 'Sapatos',
    ),
    Product(
      name: 'Levi\'s 501',
      description: 'Calça jeans de corte reto',
      price: 129.99,
      category: 'Calças',
    ),
    // Adicionando mais categorias e produtos
    Product(
      name: 'New Era 9FIFTY',
      description: 'Boné snapback com aba reta',
      price: 29.99,
      category: 'Bonés',
    ),
    Product(
      name: 'Ray-Ban Aviator',
      description: 'Óculos de sol clássico com lentes espelhadas',
      price: 159.99,
      category: 'Óculos de Sol',
    ),
  ];

  runApp(MainApp(products: productList));
}

// Classe que representa o aplicativo principal
class MainApp extends StatelessWidget {
  final List<Product> products; // Lista de produtos

  // Construtor da classe MainApp
  const MainApp({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    // Retorna um MaterialApp que é a raiz do aplicativo
    return MaterialApp(
      home: BottomNavBar(products: products), // Define a página inicial como BottomNavBar
    );
  }
}

// Classe que representa a barra de navegação inferior
class BottomNavBar extends StatefulWidget {
  final List<Product> products; // Lista de produtos

  // Construtor da classe BottomNavBar
  const BottomNavBar({super.key, required this.products});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarState createState() => _BottomNavBarState(); // Cria o estado da barra de navegação
}

// Estado da barra de navegação inferior
class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0; // Índice da página atual
  late PageController _pageController; // Controlador de página

  String _selectedCategory = ''; // Categoria selecionada

  @override
  void initState() {
    super.initState();
    _pageController = PageController(); // Inicializa o controlador de página
  }

  @override
  Widget build(BuildContext context) {
    // Retorna um Scaffold que contém a estrutura básica do aplicativo
    return Scaffold(
      backgroundColor: Colors.white, // Cor de fundo branca
      appBar: AppBar(
        title: const Text('Catálogo'), // Título da barra de aplicativos
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Implemente ação ao pressionar o ícone do lado esquerdo aqui
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Implemente ação ao pressionar o ícone do lado direito aqui
            },
          ),
        ],
      ),
      // Barra de navegação curva na parte inferior da tela
      bottomNavigationBar: CurvedNavigationBar(
        index: _page, // Índice da página atual
        items: const [
          Icon(Icons.home_outlined),
          Icon(Icons.search),
          Icon(Icons.chat_bubble_outline),
        ],
        color: Colors.blueAccent, // Cor de fundo da barra de navegação
        buttonBackgroundColor: Colors.white, // Cor do botão da barra de navegação
        backgroundColor: Colors.white, // Cor de fundo da barra de navegação
        animationCurve: Curves.easeInOut, // Curva de animação
        animationDuration: const Duration(milliseconds: 600), // Duração da animação
        onTap: (index) {
          setState(() {
            _page = index; // Atualiza o índice da página ao clicar em um item da barra de navegação
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 300), curve: Curves.ease);
          });
        },
        letIndexChange: (index) => true,
      ),
      // Menu lateral do aplicativo
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Adicione a funcionalidade para navegar para a tela inicial aqui
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Adicione a funcionalidade para navegar para a tela de configurações aqui
              },
            ),
          ],
        ),
      ),
      // Corpo do aplicativo
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        child: PageView(
          controller: _pageController, // Controlador de página para navegar entre páginas
          onPageChanged: (index) {
            setState(() {
              _page = index; // Atualiza o índice da página quando a página é alterada
            });
          },
          children: [
            _buildCategoryPage(), // Página de categorias
            // Remova _buildProductsDetalhe() daqui
          ],
        ),
      ),
    );
  }

  // Constrói a página de categorias e produtos
 Widget _buildCategoryPage() {
  // Filtrando os produtos com base na categoria selecionada
  final filteredProducts = _selectedCategory.isEmpty
      ? widget.products
      : widget.products.where((product) => product.category == _selectedCategory).toList();

  return ListView(
    children: [
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Categorias',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        height: 100,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          scrollDirection: Axis.horizontal,
          children: [
            for (var category in _getCategories()) ...[
              _buildCategoryCard(category),
              const SizedBox(width: 12), // Espaçamento entre os cards
            ],
          ],
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Produtos',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        height: 100,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          scrollDirection: Axis.horizontal,
          children: [
            for (var product in filteredProducts) ...[
              _buildProductCard(product),
              const SizedBox(width: 12), // Espaçamento entre os cards
            ],
          ],
        ),
      ),
    ],
  );
}

  // Constrói o cartão de produto
  Widget _buildProductCard(Product product) {
    return GestureDetector(
      onTap: () {
        // Implemente a navegação para a página de detalhes do produto aqui
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => _buildProductsDetalhe(product),
          ),
        );
      },
      child: Container(
        width: 100,
        height: 100,
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              product.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              'R\$ ${product.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  // Constrói a página de detalhes do produto
Widget _buildProductsDetalhe(Product product) {
  // Aqui você pode construir a página de detalhes do produto usando as informações do produto passadas como parâmetro
  // Por exemplo:
  return Scaffold(
    appBar: AppBar(
      title: const Text('Detalhes do Produto'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Nome: ${product.name}',
            style: const TextStyle(fontSize: 24),
          ),
          Text(
            'Descrição: ${product.description}',
            style: const TextStyle(fontSize: 18),
          ),
          Text(
            'Preço: R\$ ${product.price.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 18),
          ),
          Text(
            'Categoria: ${product.category}',
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    ),
  );
}

  // Constrói o cartão de categoria
  Widget _buildCategoryCard(String category) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // Atualizando a categoria selecionada
          _selectedCategory = category;
        });
        print('Categoria $category clicada!');
      },
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blue,
        child: Center(
          child: Text(
            category,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  // Obtém a lista de categorias a partir da lista de produtos
  List<String> _getCategories() {
    List<String> categories = [];
    for (var product in widget.products) {
      if (!categories.contains(product.category)) {
        categories.add(product.category);
      }
    }
    return categories;
  }

  // Método de descarte para liberar recursos quando o widget é removido da árvore de widgets
  @override
  void dispose() {
    _pageController.dispose(); // Libera o controlador de página
    super.dispose();
  }
}
