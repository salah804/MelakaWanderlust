import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LocalAdviceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Local Advice'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle('Explore Local Cuisine', textColor: Colors.indigo),
            AdviceItemWithVideo(
              tip: '1. Try local dishes and street food to experience the authentic flavors.',
              videoUrl: 'https://www.youtube.com/watch?v=jb8rnpFgfCU',
              textColor: Colors.black,
            ),

        AdviceItemWithVideo(
          tip: '2. visit local markets for fresh produce and unique snacks.',
          videoUrl: 'https://www.youtube.com/watch?v=RHRFEUDEaos&t=85s ',
          textColor: Colors.black,
        ),


            SectionTitle('Connect with Locals', textColor: Colors.indigo),

            AdviceItemWithVideo(
              tip: '1. Attend local events and festivals to engage with the community.',
              videoUrl: 'https://www.youtube.com/watch?v=GF2vM0GNGus ',
              textColor: Colors.black,
            ),

            AdviceItemWithVideo(
              tip: '2. Learn a few basic phrases in the local language to communicate with locals.',
              videoUrl: 'https://www.youtube.com/watch?v=UL0AQseo3fs  ',
              textColor: Colors.black,
            ),



            SectionTitle('Respect Local Customs', textColor: Colors.indigo),
            AdviceItemWithVideo(
              tip: '1. Research and respect local customs and traditions.',
              videoUrl: 'https://www.youtube.com/watch?v=8xOMufq0Wys ',
              textColor: Colors.black,
            ),

            AdviceItemWithVideo(
              tip: '2. Be aware of and follow local etiquette to show respect for the community.',
              videoUrl: 'https://www.youtube.com/watch?v=_Fr2in5LuY8  ',
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final Color textColor;

  SectionTitle(this.title, {this.textColor = Colors.black});

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

class AdviceItem extends StatelessWidget {
  final String advice;
  final Color textColor;

  AdviceItem(this.advice, {this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check, size: 20.0, color: Colors.yellow[900]),
          SizedBox(width: 8.0),
          Expanded(child: Text(advice, style: TextStyle(color: textColor))),
        ],
      ),
    );
  }
}

class AdviceItemWithVideo extends StatelessWidget {
  final String tip;
  final String videoUrl;
  final Color textColor;

  AdviceItemWithVideo({required this.tip, required this.videoUrl, this.textColor = Colors.black});

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
