// TipsAndAdviceScreen.dart
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
        title: Text('Tips and advice '),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Travel Tips (English)'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TravelTipsScreen()),
              );
            },
          ),
          ListTile(
            title: Text('local advice (English)'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LocalAdviceScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Travel Tips (Malay)'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TravelTipsScreenMalay()),
              );
            },
          ),
          ListTile(
            title: Text('local advice (Malay)'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LocalAdviceScreenMalay()),
              );
            },
          ),
          ListTile(
            title: Text('Promotion'),
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
