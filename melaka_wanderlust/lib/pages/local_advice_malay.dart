import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LocalAdviceScreenMalay extends StatelessWidget {
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
                Icons.lightbulb_outline,
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
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle('Teroka Makanan Tempatan', textColor: Colors.indigo),
            AdviceItemWithVideo(
              tip: '1. TEMPAT MAKAN BEST DI MELAKA | BREAKFAST, LUNCH, DINNER BEST DI MELAKA.',
              videoUrl: 'https://www.youtube.com/watch?v=VYp70hTd1cs',
              textColor: Colors.black,
              videoKey: ValueKey('unique_key_1'),  // Unique key for the first video
            ),
            AdviceItemWithVideo(
              tip: '2. Top10 Tempat Makan Best di MELAKA.',
              videoUrl: 'https://www.youtube.com/watch?v=GApa9uM6Xtk',
              textColor: Colors.black,
              videoKey: ValueKey('unique_key_2'),  // Unique key for the second video
            ),

            SectionTitle('Adat-adat dan Sejarah di Melaka', textColor: Colors.indigo),
            AdviceItemWithVideo(
              tip: '1. Sejarah Adat Budaya & Penggunaan Bahasa Melayu Melaka di Perairan Asia Tenggara.',
              videoUrl: 'https://www.youtube.com/watch?v=-juGE3axBCM',
              textColor: Colors.black,
              videoKey: ValueKey('unique_key_3'),  // Unique key for the third video
            ),
            AdviceItemWithVideo(
              tip: '2. Macam mana ada etnik PORTUGIS di Melaka?.',
              videoUrl: 'https://www.youtube.com/watch?v=BufRD2Eb6kM',
              textColor: Colors.black,
              videoKey: ValueKey('unique_key_4'),  // Unique key for the fourth video
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

class AdviceItemWithVideo extends StatelessWidget {
  final String tip;
  final String videoUrl;
  final Color textColor;

  // Add a unique key for each AdviceItemWithVideo
  final Key videoKey;

  AdviceItemWithVideo({
    required this.tip,
    required this.videoUrl,
    this.textColor = Colors.black,
    required this.videoKey,  // Pass the key as a parameter
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YoutubePlayer(
            key: videoKey,  // Assign the key to the YoutubePlayer
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
