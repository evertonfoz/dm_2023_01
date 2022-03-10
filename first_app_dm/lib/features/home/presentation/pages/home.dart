import 'package:first_app_dm/features/login/presentations/pages/login.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO Ver themas para scaffold
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.close,
          size: 50,
          color: Colors.orange,
        ),
        title: Column(
          children: const [
            Text('Primeira aula de DM'),
            Text('Scaffold'),
          ],
        ),
        centerTitle: true,
        actions: [
          Image.network(
            'https://lh3.googleusercontent.com/wEpdmU0qYb6-FPLeAwhPGpOG9x9YNz5bXKy1DiLled1xr5HtqwFYAUGIfnr7nNgoKN20WhBQTTs1XoC9aLDUDXx1VkjqEAWgLoaSXWbyek3pkltmYDRaNgPvmcswzZFUg95qDYcURfo=w400',
            width: 20,
          ),
          const SizedBox(width: 5),
          Image.network(
            'https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png',
            width: 20,
          ),
        ],
      ),
      body: _pages[_currentIndex],
      // Center(child: Image.asset('assets/images/home/nothing_yet.png')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.login),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Minha conta"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket), label: "Meus pedidos"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favoritos"),
        ],
      ),
    );
  }
}
