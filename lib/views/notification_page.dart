import 'package:flutter/material.dart';
import 'package:weather_app/widgets/custom_back_button.dart';
import 'package:weather_app/widgets/glassy_card.dart';
import 'package:weather_app/widgets/gradient_background.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Column(
          children: [
            CustomBackButton(),
            Expanded(
              child: ListView(
                children: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map(
                  (number) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                      child: GlassyCard(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: FaIcon(FontAwesomeIcons.crosshairs),
                                  color: Colors.white,
                                  iconSize: 24,
                                ),
                                Text(
                                  '10 минутын өмнөх',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            // Remove the fixed height here
                            ExpansionTile(
                              title: Text(
                                'Өдрийн турш үүлэрхэг өдөр болно, нарны халуунд санаа зовох хэрэггүй, Өдрийн турш үүлэрхэг өдөр болно, нарны халуунд санаа зовох хэрэггүй',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    'Өдрийн турш үүлэрхэг өдөр болно, нарны халуунд санаа зовох хэрэггүй, Өдрийн турш үүлэрхэг өдөр болно, нарны халуунд санаа зовох хэрэггүй',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
