import 'dart:ui'; // Import dart:ui
import 'package:flutter/material.dart';
import 'package:melaka_wanderlust/pages/local_advice.dart';
import 'package:melaka_wanderlust/pages/local_advice_malay.dart';
import 'package:melaka_wanderlust/pages/profile.dart';
import 'package:melaka_wanderlust/pages/tarvel_tips_malay.dart';
import 'package:melaka_wanderlust/pages/travel_tips.dart';
import 'package:melaka_wanderlust/pages/promotion.dart';
import '../components/nav_bar.dart';
import 'home.dart';

class TipsAndAdviceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Tips and Advice '),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          CustomListTile(
            title: 'Travel Tips (English)',
            customIcon: 'assets/travel-tips.png',
            iconColor: Colors.blue,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TravelTipsScreen()),
              );
            },
          ),
          CustomListTile(
            title: 'Local Advice (English)',
            customIcon: 'assets/local.jpg', // Update with your image path
            iconColor: Colors.yellow,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LocalAdviceScreen()),
              );
            },
          ),
          CustomListTile(
            title: 'Travel Tips (Malay)',
            customIcon: 'assets/travel-tips.png',
            iconColor: Colors.blue,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TravelTipsScreenMalay()),
              );
            },
          ),
          CustomListTile(
            title: 'Local Advice (Malay)',
            customIcon: 'assets/local.jpg', // Update with your image path
            iconColor: Colors.yellow,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LocalAdviceScreenMalay()),
              );
            },
          ),
          CustomListTile(
            title: 'Promotion',
            customIcon: 'assets/promo.jpg',
            iconColor: Colors.red,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PromotionScreen()),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 2,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
              break;
            case 1:
              break;
            case 2:
              break;
            case 3:
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
              break;
          }
        },
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String title;
  final String? customIcon;
  final Color iconColor;
  final VoidCallback onTap;

  const CustomListTile({
    required this.title,
    this.customIcon,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      contentPadding: EdgeInsets.only(left: 16.0, right: 16.0),
      leading: customIcon != null
          ? Padding(
        padding: EdgeInsets.only(right: 8.0),
        child: Image.asset(customIcon!, width: 40, height: 40),
      )
          : Icon(Icons.error, color: Colors.red),
      onTap: onTap,
    );
  }
}
