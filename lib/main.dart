import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// Definição da classe Product para representar um produto
class Product {
  final String name; // Nome do produto
  final String description; // Descrição do produto
  final double price; // Preço do produto
  final String category; // Categoria do produto
  final String imageLink; // Link da imagem do produto

  // Construtor da classe Product
  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.imageLink, // Adicionando o link da imagem ao construtor
  });
}
// Função principal que é chamada primeiro ao executar o aplicativo
void main() {
  final List<Product> productList = [
    Product(
      name: 'Nike Air Max',
      description: 'Tênis de corrida para homens',
      price: 189.99,
      category: 'Sapatos',
      imageLink: 'https://imgnike-a.akamaihd.net/768x768/00931851.jpg'
    ),
    Product(
      name: 'Adidas Superstar',
      description: 'Tênis clássico para uso diário',
      price: 99.99,
      category: 'Sapatos',
      imageLink: 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/c35214f6104c4a288bfed0c7c88dd94c_9366/Tenis_Superstar_XLG_Branco_IF9995_01_standard.jpg'
    ),
    Product(
      name: 'Polo Ralph Lauren',
      description: 'Camiseta de algodão de manga curta',
      price: 49.99,
      category: 'Camisetas',
      imageLink: 'https://iguatemi365.vtexassets.com/unsafe/963x1440/center/middle/https%3A%2F%2Figuatemi365.vtexassets.com%2Farquivos%2Fids%2F250987%2FPRL_220905_002_0054-04.jpg%3Fv%3D638142655359200000'
    ),
    Product(
      name: 'Tommy Hilfiger',
      description: 'Camiseta polo de algodão',
      price: 69.99,
      category: 'Camisetas',
      imageLink: 'https://cdn.dooca.store/946/products/1-4460_1000x1320.jpg?v=1683716992'
    ),
    // Adicionando mais produtos
    Product(
      name: 'Vans Old Skool',
      description: 'Tênis de skate clássico',
      price: 79.99,
      category: 'Sapatos',
      imageLink: 'https://lojavirus.fbitsstatic.net/img/p/tenis-vans-old-skool-black-white-vn000d3hy28-57493/300103.jpg?w=1200&h=1200&v=no-change&qs=ignore'
    ),
    Product(
      name: 'Levi\'s 501',
      description: 'Calça jeans de corte reto',
      price: 129.99,
      category: 'Calças',
      imageLink: 'https://lojalevis.vtexassets.com/arquivos/ids/486771-800-800?v=638005701135700000&width=800&height=800&aspect=true'
    ),
    // Adicionando mais categorias e produtos
    Product(
      name: 'New Era 59FIFTY',
      description: 'Boné snapback com aba reta',
      price: 29.99,
      category: 'Bonés',
      imageLink: 'https://77622.cdn.simplo7.net/static/77622/sku/thumb_bones-new-era-bone-new-era-59fifty-ny-yankees-subway-series-marinho--p-1687795898421.png'
    ),
    Product(
      name: 'Ray-Ban Aviator',
      description: 'Óculos de sol clássico com lentes espelhadas',
      price: 159.99,
      category: 'Óculos de Sol',
      imageLink: 'https://wanny.vteximg.com.br/arquivos/ids/182931-750-750/Produto.jpg?v=638234100209300000'
    ),
  ];

  runApp(MainApp(products: productList));
}

// Classe que representa o aplicativo principal
class MainApp extends StatelessWidget {
  final List<Product> products; // Lista de produtos

  // Construtor da classe MainApp
  const MainApp({Key? key, required this.products}) : super(key: key);

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
  const BottomNavBar({Key? key, required this.products}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarState createState() => _BottomNavBarState(); // Cria o estado da barra de navegação
}

// Estado da barra de navegação inferior
class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0; // Índice da página atual
  late PageController _pageController; // Controlador de página

  String _selectedCategory = ''; // Categoria selecionada
  Map<Product, int> _cart = {}; // Mapa para rastrear produtos no carrinho

  @override
  void initState() {
    super.initState();
    _pageController = PageController(); // Inicializa o controlador de página
  }

  @override
  Widget build(BuildContext context) {
    int cartItemCount = _cart.values.fold(0, (prev, curr) => prev + curr); // Contagem total de itens no carrinho

    // Retorna um Scaffold que contém a estrutura básica do aplicativo
    return Scaffold(
      backgroundColor: Colors.white, // Cor de fundo branca
 drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              margin: EdgeInsets.zero, // Remova a margem entre os cabeçalhos
              accountName: Text("Herisson Roger braga Lima"),
              accountEmail: Text("5 semestre ADS"),
              currentAccountPicture: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/112222925?v=4",
                      ),
                    ),
                    SizedBox(width: 20), // Espaço entre as fotos
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Instituto_Federal_do_Piau%C3%AD_-_Marca_Vertical_2015.svg/1200px-Instituto_Federal_do_Piau%C3%AD_-_Marca_Vertical_2015.svg.png",
                      ),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/8dcb95e4-24fe-4f0c-8a4a-e0814403088b/d57qye1-b8c79517-4349-418f-af91-46dd1f71ac89.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzhkY2I5NWU0LTI0ZmUtNGYwYy04YTRhLWUwODE0NDAzMDg4YlwvZDU3cXllMS1iOGM3OTUxNy00MzQ5LTQxOGYtYWY5MS00NmRkMWY3MWFjODkuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.cU2PLkyhmcPpfcr9ALEObSuuVglc3qBsaL9B_0-ixgg",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            UserAccountsDrawerHeader(
              margin: EdgeInsets.zero, // Remova a margem entre os cabeçalhos
              accountName: Text("Breno Ramon Lacerda Santos"),
              currentAccountPicture: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    CircleAvatar(
                      radius: 23,
                      backgroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/108709080?v=4",
                      ),
                    ),
                  ],
                ),
              ),
              accountEmail: Text("5 semestre ADS"),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/8dcb95e4-24fe-4f0c-8a4a-e0814403088b/d57qye1-b8c79517-4349-418f-af91-46dd1f71ac89.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzhkY2I5NWU0LTI0ZmUtNGYwYy04YTRhLWUwODE0NDAzMDg4YlwvZDU3cXllMS1iOGM3OTUxNy00MzQ5LTQxOGYtYWY5MS00NmRkMWY3MWFjODkuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.cU2PLkyhmcPpfcr9ALEObSuuVglc3qBsaL9B_0-ixgg",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Catálogo'), // Título da barra de aplicativos
       
        actions: [
          IconButton(
            icon: Stack(
              children: [
                const Icon(Icons.shopping_cart), // Ícone do carrinho
                if (cartItemCount > 0) // Exibe a contagem apenas se houver itens no carrinho
                  Positioned(
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 9,
                      child: Text(
                        cartItemCount.toString(),
                        style: const TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
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
          height: 225,
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
  int itemCount = _cart.containsKey(product) ? _cart[product]! : 0;

  return GestureDetector(
    onTap: () {
      _showProductDetails(product); // Exibe os detalhes do produto quando o usuário clica no cartão do produto
    },
    child: Container(
      width: 160,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
              image: DecorationImage(
                image: NetworkImage(product.imageLink), // Usando o link da imagem do produto
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'R\$ ${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        // Implemente a lógica para diminuir a quantidade do produto no carrinho
                        setState(() {
                          if (_cart.containsKey(product) && _cart[product]! > 1) {
                            _cart[product] = _cart[product]! - 1;
                          } else {
                            _cart.remove(product);
                          }
                        });
                      },
                    ),
                    Text(
                      itemCount.toString(), // Exibe a quantidade de itens no carrinho
                      style: const TextStyle(fontSize: 12),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        // Implemente a lógica para adicionar o produto ao carrinho aqui
                        setState(() {
                          if (_cart.containsKey(product)) {
                            _cart[product] = _cart[product]! + 1; // Incrementa a quantidade se o produto já estiver no carrinho
                          } else {
                            _cart[product] = 1; // Adiciona o produto ao carrinho com quantidade 1 se não estiver no carrinho
                          }
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
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

  // Método para exibir os detalhes do produto
  void _showProductDetails(Product product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(product.name),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Descrição: ${product.description}'),
                Text('Preço: R\$ ${product.price.toStringAsFixed(2)}'),
                Text('Categoria: ${product.category}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  // Método de descarte para liberar recursos quando o widget é removido da árvore de widgets
  @override
  void dispose() {
    _pageController.dispose(); // Libera o controlador de página
    super.dispose();
  }
}