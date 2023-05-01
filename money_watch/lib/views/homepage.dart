import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Money watch"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          Align(
            alignment: Alignment.center,
            child: CircularPercentIndicator(
              radius: 150.0,
              lineWidth: 30.0,
              percent: 0.30,
              center: Text("this percent"),
              progressColor: Colors.blueGrey,
              footer: Text("You have"),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => AlertDialog(
                    actions: [
                      Text("data"),
                    ],
                  ),
                  child: Icon(Icons.remove),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4),
              ),
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                    onPressed: () => AlertDialog(
                          actions: [
                            Text(""),
                          ],
                        ),
                    child: Icon(Icons.add),
                    style: ButtonStyle()),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
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
        selectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
