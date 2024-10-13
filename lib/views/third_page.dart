import 'package:flutter/material.dart';
import 'package:weather_app/widgets/custom_appbar.dart';
import 'package:weather_app/widgets/glassy_card.dart';
import 'package:weather_app/widgets/gradient_background.dart';

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Column(
        children: [
          CustomAppbar(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Color.fromARGB(
                  100, 0, 0, 0), // Background color for the search bar
              borderRadius: BorderRadius.circular(16), // Rounded corners
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                border: InputBorder.none, // Remove underline
                icon: Icon(Icons.search), // Add search icon
              ),
              onChanged: (value) {
                // Handle search logic here
                print('Search query: $value');
              },
            ),
          ),
          Expanded(
            child: ListView(
                children: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map(
              (number) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: GlassyCard(
                    child: Container(
                      height: 150,
                      child: Text('Hehe'),
                    ),
                  ),
                );
              },
            ).toList()),
          )
        ],
      ),
    );
  }
}
