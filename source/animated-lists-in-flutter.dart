//Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NetworkImage extends StatelessWidget {
  final String url;
  const NetworkImage({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      loadingBuilder: (context, child, loadingProgress) {
        final totalBytes = loadingProgress?.expectedTotalBytes;
        final bytesLoaded = loadingProgress?.cumulativeBytesLoaded;
        if (totalBytes != null && bytesLoaded != null) {
          return LinearProgressIndicator(
            value: bytesLoaded / totalBytes,
          );
        } else {
          return child;
        }
      },
      errorBuilder: (context, error, stackTrace) {
        return Text('Error!');
      },
    );
  }
}

class NetworkImageCard extends StatelessWidget {
  final String url;
  const NetworkImageCard({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: NetworkImage(
          url: url,
        ),
      ),
    );
  }
}

const imageUrls = [
  'https://bit.ly/3x7J5Qt',
  'https://bit.ly/3ywI8l6',
  'https://bit.ly/36fNNj9',
  'https://bit.ly/3jOueGG',
  'https://bit.ly/3qYOtDm',
  'https://bit.ly/3wt11Ec',
  'https://bit.ly/3yvFg7X',
  'https://bit.ly/3ywzOla',
  'https://bit.ly/3wnASpW',
  'https://bit.ly/3jXSDto',
];

Stream<String> images() => Stream.periodic(
      Duration(seconds: 3),
      (index) => index % imageUrls.length,
    ).map((index) => imageUrls[index]);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  List<String> imageUrls = [];

  void populateList() async {
    await for (final url in images()) {
      imageUrls.insert(0, url);
      _key.currentState?.insertItem(
        0,
        duration: Duration(milliseconds: 400),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    populateList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Lists in Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedList(
          key: _key,
          initialItemCount: imageUrls.length,
          itemBuilder: (context, index, animation) {
            final imageUrl = imageUrls[index];
            return SizeTransition(
              sizeFactor: animation.drive(
                CurveTween(curve: Curves.elasticInOut),
              ),
              child: Column(
                children: [
                  NetworkImageCard(url: imageUrl),
                  SizedBox(height: 10.0),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
