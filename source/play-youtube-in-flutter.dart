// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

const videoIds = [
  'BHACKCNDMW8',
  '26h9hBZFl7w',
  'glENND73k4Q',
  'd0tU18Ybcvk',
];

class VideoView extends StatelessWidget {
  final String videoId;
  final _key = UniqueKey();

  VideoView({required this.videoId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watch a Video'),
      ),
      body: Center(
        child: Container(
          height: 232.0,
          child: WebView(
            key: _key,
            initialUrl: 'https://www.youtube.com/embed/$videoId',
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
      ),
    );
  }
}

class YouTubeVideoThumbnail extends StatelessWidget {
  final String videoId;
  final String thumbnailUrl;

  const YouTubeVideoThumbnail({Key? key, required this.videoId})
      : thumbnailUrl = 'https://img.youtube.com/vi/$videoId/maxresdefault.jpg',
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => VideoView(videoId: videoId),
          ),
        );
      },
      child: Container(
        height: 256.0,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 10.0,
              color: Colors.black.withAlpha(50),
              spreadRadius: 10.0,
            ),
          ],
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: NetworkImage(thumbnailUrl),
          ),
        ),
        child: Center(
          child: Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: 100.0,
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('YouTube Videos in Flutter')),
      body: ListView.builder(
        itemCount: videoIds.length,
        itemBuilder: (context, index) {
          final videoId = videoIds[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: YouTubeVideoThumbnail(videoId: videoId),
          );
        },
      ),
    );
  }
}
