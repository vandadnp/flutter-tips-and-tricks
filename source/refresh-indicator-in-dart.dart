// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const allImages = [
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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _images = [allImages.first];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Refresh Indicator in Flutter'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final nextIndex = _images.length + 1;
          if (nextIndex < allImages.length) {
            setState(() {
              _images.insert(0, allImages[nextIndex]);
            });
          }
        },
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          itemCount: _images.length,
          itemBuilder: (context, index) {
            final imageUrl = _images[index];
            return Column(
              children: [
                RoundedImageWithShadow(url: imageUrl),
                const SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
    );
  }
}

class RoundedImageWithShadow extends StatelessWidget {
  final String url;
  const RoundedImageWithShadow({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: Colors.black.withAlpha(40),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Image.network(url),
    );
  }
}
