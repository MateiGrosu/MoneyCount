import 'package:flutter/material.dart';
import 'package:money_watch/api/firebase.dart';
import 'package:money_watch/views/home_view.dart';
import 'package:money_watch/views/total_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  var list = getListID();
  List<dynamic> _spendTotal = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getTotalSpend();
  }

  _getTotalSpend() async {
    final data = await getSpend();
    setState(() {
      _spendTotal = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      HomeView(),
      SpendView(
        spendTotal: _spendTotal,
      ),
    ];
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
