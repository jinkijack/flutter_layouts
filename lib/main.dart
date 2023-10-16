import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LayoutSwitcher(),
    );
  }
}

class LayoutSwitcher extends StatefulWidget {
  const LayoutSwitcher({Key? key}) : super(key: key);

  @override
  _LayoutSwitcherState createState() => _LayoutSwitcherState();
}

class _LayoutSwitcherState extends State<LayoutSwitcher> {
  int _selectedLayoutIndex = 0;

  final List<Widget> _layouts = [
    const FirstLayout(),
    const SecondLayout(),
    const ThirdLayout(),
    const FourthLayout(),
  ];

  final List<AppBar> _appBars = [
    _buildFirstAppBar(),
    _buildSecondAppBar(),
    _buildThirdAppBar(),
    _buildFourthAppBar(),
  ];

  static AppBar _buildFirstAppBar() {
    return AppBar(
      title: const Text('MEU APP'),
    );
  }

  static AppBar _buildSecondAppBar() {
    return AppBar(
      title: const Text('MEU APP'),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // Adicione a ação de pesquisa aqui
          },
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            // Adicione a ação de configurações aqui
          },
        ),
      ],
      leading: const Icon(Icons.person),
    );
  }

  static AppBar _buildThirdAppBar() {
    return AppBar(
      title: const Text('MEU APP'),
    );
  }

  static AppBar _buildFourthAppBar() {
    return AppBar(
      title: const Text('MEU APP'),
      backgroundColor: Colors.red,
    );
  }

  void _onLayoutSelected(int index) {
    setState(() {
      _selectedLayoutIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBars[_selectedLayoutIndex],
      body: _layouts[_selectedLayoutIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey, // Cor do ícone do item inativo
        selectedLabelStyle:
            const TextStyle(color: Colors.blue), // Cor do rótulo do item ativo
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        currentIndex: _selectedLayoutIndex,
        onTap: _onLayoutSelected,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Layout 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Layout 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Layout 3',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility),
            label: 'Layout 4',
          )
        ],
      ),
    );
  }
}

class FirstLayout extends StatelessWidget {
  const FirstLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 200,
        height: 200,
        margin: const EdgeInsets.all(100),
        decoration: BoxDecoration(
          color: Colors.purple,
          border: Border.all(
            color: Colors.green,
            width: 2.0,
          ),
        ),
        child: const Text(
          'Olá',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class SecondLayout extends StatelessWidget {
  const SecondLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'OLÁ',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ThirdLayout extends StatelessWidget {
  const ThirdLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Adicionar ação aqui
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: const BorderSide(color: Colors.green),
          ),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.add, color: Colors.white),
            Text('Adicionar Informações',
                style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

class FourthLayout extends StatelessWidget {
  const FourthLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text.rich(
          TextSpan(
            text: 'Este é meu ',
            style: TextStyle(
              fontSize: 24,
              color: Colors.green, // Cor do texto antes de "App"
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'App',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.blue, // Cor do texto "App"
                  fontWeight: FontWeight.bold, // Texto em negrito
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.bottomRight,
          child: TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Usuário adicionado com sucesso!'),
                ),
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.red, // Cor de fundo do botão
            ),
            child: const Text(
              'Adicionar usuário',
              style: TextStyle(
                color: Colors.white, // Cor do texto
              ),
            ),
          ),
        ),
      ),
    );
  }
}
