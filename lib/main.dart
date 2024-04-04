import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import './home/home.dart';

void main() {
  // Criando uma lista de produtos
  final List<Product> productList = [
    Product(
      name: 'Produto 1',
      description: 'Descrição do Produto 1',
      price: 10.0,
    ),
    Product(
      name: 'Produto 2',
      description: 'Descrição do Produto 2',
      price: 20.0,
    ),
    Product(
      name: 'Produto 3',
      description: 'Descrição do Produto 3',
      price: 30.0,
    ),
    Product(
      name: 'Produto 4',
      description: 'Descrição do Produto 3',
      price: 30.0,
    ),
    Product(
      name: 'Produto 1',
      description: 'Descrição do Produto 1',
      price: 10.0,
    ),
    Product(
      name: 'Produto 2',
      description: 'Descrição do Produto 2',
      price: 20.0,
    ),
    Product(
      name: 'Produto 3',
      description: 'Descrição do Produto 3',
      price: 30.0,
    ),
    Product(
      name: 'Produto 4',
      description: 'Descrição do Produto 3',
      price: 30.0,
    ),
    Product(
      name: 'Produto 1',
      description: 'Descrição do Produto 1',
      price: 10.0,
    ),
    Product(
      name: 'Produto 2',
      description: 'Descrição do Produto 2',
      price: 20.0,
    ),
    Product(
      name: 'Produto 3',
      description: 'Descrição do Produto 3',
      price: 30.0,
    ),
    Product(
      name: 'Produto 4',
      description: 'Descrição do Produto 3',
      price: 30.0,
    ),
    Product(
      name: 'Produto 1',
      description: 'Descrição do Produto 1',
      price: 10.0,
    ),
    Product(
      name: 'Produto 2',
      description: 'Descrição do Produto 2',
      price: 20.0,
    ),
    Product(
      name: 'Produto 3',
      description: 'Descrição do Produto 3',
      price: 30.0,
    ),
    Product(
      name: 'Produto 4',
      description: 'Descrição do Produto 3',
      price: 30.0,
    ),
  ];

  runApp(MainApp(products: productList));
}

class MainApp extends StatelessWidget {
  final List<Product> products;

  const MainApp({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavBar(products: products),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  final List<Product> products;

  BottomNavBar({Key? key, required this.products}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        index: _page,
        items: [
          Icon(Icons.home_outlined),
          Icon(Icons.search),
          Icon(Icons.chat_bubble_outline),
        ],
        color: Colors.blueAccent,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
            _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.ease);
          });
        },
        letIndexChange: (index) => true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
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
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Adicione a funcionalidade para navegar para a tela inicial aqui
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Adicione a funcionalidade para navegar para a tela de configurações aqui
              },
            ),
          ],
        ),
      ),
      body: PageView(
  controller: _pageController,
  onPageChanged: (index) {
    setState(() {
      _page = index;
    });
  },
  children: [
    Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: widget.products.map((product) {
            return Container(
              margin: EdgeInsets.all(10.0),
              width: 200.0,
              height: 200.0,
              color: Colors.grey,
              child: Center(
                child: Text(
                  product.name,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    ),
    Container(color: Colors.green), // Exemplo de outra página
    Container(color: Colors.red),   // Exemplo de outra página
  ],
),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}