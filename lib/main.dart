import 'package:flutter/material.dart';
import 'screens/kalkulator.dart'; // Pastikan KalkulatorPageContent sudah ada di path ini
import 'screens/riwayat.dart'; // Pastikan RiwayatPage sudah ada di path ini
import 'screens/profil.dart'; // Pastikan ProfilPage sudah ada di path ini


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalkulator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainMenu(),
    );
  }
}

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _selectedIndex = 0;
  List<String> calculationHistory = []; // Change to List<String> for simplicity

  void addToHistory(String expression, String result) {
    setState(() {
      calculationHistory.add("$expression = $result");
    });
  }

  final List<Widget> _pages = [];

  @override
void initState() {
  super.initState();
  _pages.add(KalkulatorPageContent(onCalculation: addToHistory));
  _pages.add(RiwayatPage(history: calculationHistory)); // Pass the history to RiwayatPage
  _pages.add(ProfilPage()); // Hapus parameter profil, cukup inisialisasi ProfilPage
}


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator App'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Kalkulator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

