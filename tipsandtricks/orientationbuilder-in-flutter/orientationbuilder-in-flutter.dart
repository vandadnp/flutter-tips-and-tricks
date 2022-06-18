// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            final int count;
            switch (orientation) {
              case Orientation.portrait:
                count = 2;
                break;
              case Orientation.landscape:
                count = 4;
                break;
            }
            return GridView.count(
              padding: const EdgeInsets.all(8.0),
              crossAxisCount: count,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              children: images
                  .map((url) => RoundedImageWithShadow(url: url))
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}

final images = [
  'https://bit.ly/3qJ2FCf',
  'https://bit.ly/3Hs9JsV',
  'https://bit.ly/3cfT6Cv',
  'https://bit.ly/30wGnIE',
  'https://bit.ly/3kJYsum',
  'https://bit.ly/3oDoMaJ',
  'https://bit.ly/3FndXQM',
  'https://bit.ly/3ci4i1f',
];
