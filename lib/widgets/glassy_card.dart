// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:ui';
import 'package:flutter/material.dart';

class GlassyCard extends StatelessWidget {
  final Widget child; // The widget to be displayed inside the glassy card
  final EdgeInsetsGeometry? margin; // Optional margin for customization

  const GlassyCard({
    Key? key,
    required this.child, // Child widget is required
    this.margin, // Margin can be customized, otherwise uses default
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: margin ?? EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1), // Semi-transparent white
        borderRadius: BorderRadius.circular(32),
        border:
            Border.all(color: Colors.white.withOpacity(0.3)), // Optional border
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Blur effect
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(16), // Padding inside the card
            child: child, // Display the child widget inside the glassy card
          ),
        ),
      ),
    );
  }
}
