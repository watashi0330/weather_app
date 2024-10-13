import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'views/splash_screen.dart'; // Import the second page

void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintLayerBordersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          textTheme: const TextTheme(
              bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w300,
          ))),
      home: SplashScreen(),
    );
  }
}
