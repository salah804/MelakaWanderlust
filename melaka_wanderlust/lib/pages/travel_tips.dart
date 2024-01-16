import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TravelTipsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange,
              ),
              child: Icon(
                Icons.flight,
                color: Colors.white,
                size: 24.0,
              ),
            ),
            SizedBox(width: 8.0),
            Text('Travel Tips'),
          ],
        ),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SectionTitle(title: 'Pack Smartly', textColor: Colors.indigo),
              TipsItemWithVideo(
                tip: '1. How To Pack Light For A Long Trip.',
                videoUrl: 'https://www.youtube.com/watch?v=Eqc4A3J5rWg&t=12s ',
                textColor: Colors.black,
              ),

              TipsItemWithVideo(
                tip: '2. Don\'t forget essential items like chargers, medications, and toiletries.',
                videoUrl: 'https://www.youtube.com/watch?v=KNhLjhjZj3w',
                textColor: Colors.black,
              ),

              // Add similar sections for 'Stay Safe', 'Travel on a Budget', and 'Make the Most of Your Trip'

              SectionTitle(title: 'Stay Safe', textColor: Colors.indigo),
              TipsItemWithVideo(
                tip: '1. How to Keep Valuables Safe While Traveling.',
                videoUrl: 'https://www.youtube.com/watch?v=sTJg5EsDdQE',
                textColor: Colors.black,
              ),
              TipsItemWithVideo(
                tip: '2. How Can I Stay Safe When Travelling Alone? | Solo Travel Safety Tips.',
                videoUrl: 'https://www.youtube.com/watch?v=tG-TD4iVhag ',
                textColor: Colors.black,
              ),

              SectionTitle(title: 'Travel on a Budget', textColor: Colors.indigo),
              TipsItemWithVideo(
                tip: '1. Top 10 Budget Hotels in Melaka.',
                videoUrl: 'https://www.youtube.com/watch?v=88CwmwmQAxY',
                textColor: Colors.black,
              ),
              TipsItemWithVideo(
                tip: '2. Take advantage of free or low-cost activities and attractions.',
                videoUrl: 'https://www.youtube.com/watch?v=VBgA73L9aR4',
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
