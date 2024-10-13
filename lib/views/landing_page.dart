// Тойм 7 хоногийн мэдээг дэлгэцлэх, тухайн байршлыг GPS ашиглан олох
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:weather_app/views/first_page.dart';
import 'package:weather_app/views/second_page.dart';
import 'package:weather_app/views/third_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [FirstPage(), SecondPage(), ThirdPage()];
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny),
            label: '1 page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny),
            label: '2 page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny),
            label: '3 page',
          )
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      body: _pages[_currentIndex],
    );
  }
}
