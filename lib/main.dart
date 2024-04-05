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
    ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Título 1',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCard(),
                  SizedBox(width: 12),
                  _buildCard(),
                  SizedBox(width: 12),
                  _buildCard(),
                  SizedBox(width: 12),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Título 2',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCard(),
                  SizedBox(width: 100),
                  _buildCard(),
                  SizedBox(width: 12),
                  _buildCard(),
                  SizedBox(width: 12),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
    ListView(
      children: [
        Container(
          color: Colors.green,
          child: Center(
            child: Text(
              'Página 2',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ],
    ),
    ListView(
      children: [
        Container(
          color: Colors.red,
          child: Center(
            child: Text(
              'Página 3',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ],
    ),
  ],
),
  
    );
  }

 Widget _buildCard() => Container(
  width: 200, // Defina a largura igual à altura para fazer o card quadrado
  height: 200,
  color: Colors.red,
  child: Image.network(
    "https://imgnike-a.akamaihd.net/360x360/027285ID.jpg",
    fit: BoxFit.cover,
  ),
);


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
