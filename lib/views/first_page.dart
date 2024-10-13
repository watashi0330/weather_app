import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/services/location_service.dart'; // Make sure to import your location service
import 'package:weather_app/widgets/custom_appbar.dart';
import 'package:weather_app/widgets/glassy_card.dart';
import 'package:weather_app/widgets/gradient_background.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For decoding JSON responses

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String _weatherMessage = 'Fetching weather...';
  String _cityName = 'loading...';
  String _description = 'loading...';
  double _temperature = 0;
  double _temperatureMin = 0;
  double _temperatureMax = 0;
  final LocationService _locationService =
      LocationService(); // Create an instance of the service

  @override
  void initState() {
    super.initState();
    _getWeatherForCurrentLocation();
  }

  // Method to get location and fetch weather data
  Future<void> _getWeatherForCurrentLocation() async {
    Position? position = await _locationService.getCurrentLocation();
    if (position != null) {
      const apiKey = "18a60b43acdcfbc8a4a4d9ae33d1e497";
      final url =
          'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey&units=metric';
      final response = await http.get(Uri.parse(url));
      print(position);
      if (response.statusCode == 200) {
        // Parse weather data from the response
        var weatherData = jsonDecode(response.body);

        setState(() {
          _cityName = weatherData['name'];
          _description = weatherData['weather'][0]['description'];
          _temperature = weatherData['main']['temp'];
          _temperatureMin = weatherData['main']['temp_min'];
          _temperatureMax = weatherData['main']['temp_max'];
        });
      } else {
        setState(() {
          _weatherMessage = 'Failed to load weather data';
        });
      }
    } else {
      setState(() {
        _weatherMessage = 'Failed to get location';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        GradientBackground(
          child: Column(
            children: [
              CustomAppbar(),
              Column(
                children: [
                  // Replace with your logo or image
                  Image.network(
                    height: 150,
                    width: 150,
                    'https://s3-alpha-sig.figma.com/img/a895/e1e4/dfd1fd16b3c3ce01cac90f370fd0ec67?Expires=1729468800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=oZkgngvAmpJjwoYrQJBwzVDU0QJQQt2VorhWxr~ZU9EjulvNpHGuUvH~8xcsYBeUcOXA-2xMu~q6x3G3KfL4TPIHdLZkYZMYvJxxU-b~Xh5rOllPd1KtmJItEM7sZgGVZgNUzaevu8MM7zJREr50muggLclBMkjUtuIaa-Jqi-kWQc5WXcKdEE1Qu5LJWrdwVn9xaoIyHinLqdKdbC-01gxqwlNZ05E2kRjzHuHd0qdfwl73VfxPjglUmfcKN7Bt6p5FSdGvOtEwKsEidPIeQ~WbTIQOWKjNgBikVTEr3dcLrB3ALfozam2x3G-BwNGtde31Wbe4Fd6g61GgirS~oQ__',
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _cityName,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    _description,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    'Их: $_temperatureMax°   Бага: $_temperatureMin°',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Image.network(
                    height: 200,
                    width: 300,
                    'https://img.freepik.com/premium-photo/christmas-snow-house-tree_943840-177.jpg',
                  ),
                  GlassyCard(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Өнөөдөр',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              ' 9 сарын 23',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Container(
                          height: 150,
                          padding: EdgeInsets.only(top: 20),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [1, 2, 3, 4, 5, 6, 7].map((number) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
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
                                      "15:00", // Replace with dynamic data if needed
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
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
