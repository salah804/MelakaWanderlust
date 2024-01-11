import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TravelTipsScreenMalay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Travel Tips '),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SectionTitle(title: '	Pek dengan bijak', textColor: Colors.indigo),
              TipsItemWithVideo(
                tip: '1. TIGA CARA MUDAH PACK BAJU UNTUK TRAVEL.',
                videoUrl: 'https://www.youtube.com/watch?v=ZB_qbgrI3Ok ',
                textColor: Colors.black,
              ),

              TipsItemWithVideo(
                tip: '2. Barang Wajib Bawa Masa Travel | Macam Mana.',
                videoUrl: 'https://www.youtube.com/watch?v=oFPBGjdycyc   ',
                textColor: Colors.black,
              ),

              // Add similar sections for 'Stay Safe', 'Travel on a Budget', and 'Make the Most of Your Trip'

              SectionTitle(title: 'cara berhati-hati ketika berlancong ', textColor: Colors.indigo),
              TipsItemWithVideo(
                tip: '1. TIPS KESELAMATAN KETIKA TRAVEL.',
                videoUrl: 'https://www.youtube.com/watch?v=AOYjZbditso  ',
                textColor: Colors.black,
              ),
              TipsItemWithVideo(
                tip: '2. Travel Tips ✈️: 12 First Time Traveller Perlu Tahu!.',
                videoUrl: '	https://www.youtube.com/watch?v=LE_78MM_bTE ',
                textColor: Colors.black,
              ),

              SectionTitle(title: 'melancong dengan budjet murah', textColor: Colors.indigo),
              TipsItemWithVideo(
                tip: '1. Kaki Travel Share Rahsia Travel Murah.',
                videoUrl: '	https://www.youtube.com/watch?v=HaGow71PzrI ',
                textColor: Colors.black,
              ),
              TipsItemWithVideo(
                tip: '2.  || Bagaimana Melancong dengan Bajet yang Kecil?? Tips and Tricks.',
                videoUrl: 'https://www.youtube.com/watch?v=lekQ-UPVoMI',
                textColor: Colors.black,
              ),


            ],
          ),
        ),
      ),
    );
  }
}

class TipsItemWithVideo extends StatelessWidget {
  final String tip;
  final String videoUrl;
  final Color textColor;

  TipsItemWithVideo({required this.tip, required this.videoUrl, this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: YoutubePlayer.convertUrlToId(videoUrl) ?? '',
              flags: YoutubePlayerFlags(autoPlay: false, mute: false),
            ),
            showVideoProgressIndicator: true,
          ),
          SizedBox(height: 8.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.check, size: 20.0, color: Colors.yellow[900]),
              SizedBox(width: 8.0),
              Expanded(child: Text(tip, style: TextStyle(color: textColor))),
            ],
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final Color textColor;

  SectionTitle({required this.title, this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: textColor),
      ),
    );
  }
}
