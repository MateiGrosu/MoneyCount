import 'package:flutter/material.dart';
import 'package:money_watch/views/home_view.dart';
import 'package:money_watch/views/total_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeView(),
    totalSpendingList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("Money watch"),
      ),
      body: _pages.elementAt(_selectedIndex),
      backgroundColor: Color.fromARGB(255, 99, 100, 99),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Colors.grey,
        iconSize: 25,
        selectedFontSize: 15,
        selectedIconTheme: IconThemeData(color: Colors.black, size: 30),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.abc),
            label: 'Spendings',
          ),
        ],
      ),
    );
  }
}
