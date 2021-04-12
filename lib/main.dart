import 'package:flutter/material.dart';
import 'floripa.dart';
import 'biguacu.dart';
import 'palhoca.dart';


void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndexHome = 0;
  List<Widget> pages = [
    Floripa(),
    Biguacu(),
    Palhoca(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndexHome],
      backgroundColor: Colors.blueAccent,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndexHome,
        onTap: (index) {
          setState(() {
            _currentIndexHome = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.cloud), label: "Florianópolis"),
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: "Biguaçu"),
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: "Palhoça"),
        ],
      ),
    );
  }
}
