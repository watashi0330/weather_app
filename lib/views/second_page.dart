import 'package:flutter/material.dart';
import 'package:weather_app/widgets/custom_appbar.dart';
import 'package:weather_app/widgets/glassy_card.dart';
import 'package:weather_app/widgets/gradient_background.dart';

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Column(
        children: [
          CustomAppbar(),
          const Text(
            'Улаанбаатар',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
          const Text(
            'Их: 24°   Бага:2°',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
          const Text(
            '7 хоногийн мэдээлэл',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  height: 180,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [1, 2, 3, 4, 5, 6].map((number) {
                      return GlassyCard(
                        margin: EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Text(
                              "19°C", // Replace with dynamic data if needed
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Image.network(
                              height: 60,
                              width: 60,
                              'https://s3-alpha-sig.figma.com/img/a895/e1e4/dfd1fd16b3c3ce01cac90f370fd0ec67?Expires=1729468800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=oZkgngvAmpJjwoYrQJBwzVDU0QJQQt2VorhWxr~ZU9EjulvNpHGuUvH~8xcsYBeUcOXA-2xMu~q6x3G3KfL4TPIHdLZkYZMYvJxxU-b~Xh5rOllPd1KtmJItEM7sZgGVZgNUzaevu8MM7zJREr50muggLclBMkjUtuIaa-Jqi-kWQc5WXcKdEE1Qu5LJWrdwVn9xaoIyHinLqdKdbC-01gxqwlNZ05E2kRjzHuHd0qdfwl73VfxPjglUmfcKN7Bt6p5FSdGvOtEwKsEidPIeQ~WbTIQOWKjNgBikVTEr3dcLrB3ALfozam2x3G-BwNGtde31Wbe4Fd6g61GgirS~oQ__',
                            ),
                            Text(
                              "Monday", // Replace with dynamic data if needed
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                      );
                    }).toList(), // Ensure to convert the Iterable back to a List
                  ),
                ),
                GlassyCard(
                  child: Container(
                    height: 200,
                    child: Text('Air quality'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GlassyCard(
                      child: Container(
                        height: 120,
                        width: 120,
                        child: Text('Sunrise'),
                      ),
                    ),
                    GlassyCard(
                      child: Container(
                        height: 120,
                        width: 120,
                        child: Text('UV index'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
