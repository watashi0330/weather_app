import 'package:flutter/material.dart';
import 'package:weather_app/widgets/gradient_background.dart';

import 'landing_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the second page after a delay
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LandingPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Replace with your logo or image
              Image.network(
                height: 200,
                width: 200,
                'https://s3-alpha-sig.figma.com/img/a895/e1e4/dfd1fd16b3c3ce01cac90f370fd0ec67?Expires=1729468800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=oZkgngvAmpJjwoYrQJBwzVDU0QJQQt2VorhWxr~ZU9EjulvNpHGuUvH~8xcsYBeUcOXA-2xMu~q6x3G3KfL4TPIHdLZkYZMYvJxxU-b~Xh5rOllPd1KtmJItEM7sZgGVZgNUzaevu8MM7zJREr50muggLclBMkjUtuIaa-Jqi-kWQc5WXcKdEE1Qu5LJWrdwVn9xaoIyHinLqdKdbC-01gxqwlNZ05E2kRjzHuHd0qdfwl73VfxPjglUmfcKN7Bt6p5FSdGvOtEwKsEidPIeQ~WbTIQOWKjNgBikVTEr3dcLrB3ALfozam2x3G-BwNGtde31Wbe4Fd6g61GgirS~oQ__',
              ),
              const SizedBox(height: 20),
              const Text(
                'Цаг агаарын мэдээ',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
