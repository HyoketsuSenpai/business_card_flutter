
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: BusinessCard(width: MediaQuery.sizeOf(context).width, height: MediaQuery.sizeOf(context).height),
        ),
      ),
    );
  }
}

class BusinessCard extends StatelessWidget{
  const BusinessCard({super.key, required this.width, required this.height});
  
  final double width;
  final double height;

  

  @override
  Widget build(BuildContext context) {
    
    double cardWidth = width * 0.6;
    double cardHeight = height * 0.5;

    if(width <= 500) {
      cardWidth = width;
    }

    if(height <= 250) {
      cardHeight = height;
    }

    double picRadius = (cardWidth + cardHeight) * 0.5 * 0.25;

    double fontSize = picRadius * 0.3;

    return Container(
      
      decoration: BoxDecoration(
              border: Border.all(color: Colors.white.withAlpha(120)),
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withAlpha(180),
                  Colors.white.withAlpha(100),
                ]
              )
            ),
          
      width: cardWidth,
      height: cardHeight,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Pic(picRadius: picRadius),
              NameAndProfession(fontSize: fontSize),
            ],
          ),

          Divider(
            color: Colors.black,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              
              ClickableUrls(
                urlString: "https://mail.google.com/mail/?view=cm&fs=1&to=youseftela@example.com",
                icon: Icons.email_outlined,
                error: "Couldn't open Gmail",
                ),

              ClickableUrls(
                urlString: "tel:0912346775",
                icon: Icons.local_phone_outlined,
                error: "Couldn't open dail",
                ),
              
              ClickableUrls(
                urlString: "https://www.linkedin.com/in/yosefe-tilahun-a37a62286/",
                icon: null,
                brandName: Brands.linkedin,
                ),
              
              ClickableUrls(
                urlString: "https://github.com/HyoketsuSenpai",
                icon: null,
                brandName: Brands.github,
                ),

            ],
          )
        
        ],
      ),
    );
  }
}

class NameAndProfession extends StatelessWidget {
  const NameAndProfession({
    super.key,
    required this.fontSize,
  });

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Yosefe Tilahun",
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            ),
        ),
    
        Text(
          "Software Engineer",
          style: TextStyle(
            fontSize: fontSize * 0.6,
            ),
        ),
      ],
    );
  }
}

class Pic extends StatelessWidget {
  const Pic({
    super.key,
    required this.picRadius,
  });

  final double picRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
    
      width: picRadius,
      height: picRadius,
    
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/blue.jpg")),
        borderRadius: BorderRadius.circular(picRadius),
      ),
    
    );
  }
}

class ClickableUrls extends StatelessWidget {
  const ClickableUrls({
    super.key, required this.urlString, required this.icon, this.text = "", this.error = "Couldn't open link", this.brandName,
  });

  final String urlString;
  final IconData? icon;
  final String? brandName;
  final String text;
  final String error;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final Uri url = Uri.parse(urlString);
        
        await launchUrl(url);
      },
      child: Wrap(
        children: [
          (icon != null)? Icon(icon) : Brand(brandName),
          Text(text),
        ],
      ),
    );
  }
}


