import 'package:flutter/material.dart';
import 'package:LatihanKuis/screens/home.dart';
import 'package:LatihanKuis/screens/profile_screen.dart';

class Root extends StatefulWidget {
  final String username;

  const Root({super.key, required this.username});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomeScreen(),
      ProfileScreen(username: widget.username),
    ];
    List<String> titles = ["Home", "Profile"];

    return Scaffold(
      appBar: AppBar(title: Text(titles[_selectedIndex])),

      body: screens[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}