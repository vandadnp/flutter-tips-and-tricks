// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Linear Gradient in Flutter'),
      ),
      body: const ImageWithShadow(url: 'https://bit.ly/3otHHog'),
    );
  }
}

class ImageWithShadow extends StatelessWidget {
  final String url;

  const ImageWithShadow({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10.0,
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(0.0, 3.0),
                  )
                ],
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 176, 229, 251),
                    Color.fromARGB(255, 235, 202, 250)
                  ],
                ),
              ),
            ),
          ),
          Image.network(url),
        ],
      ),
    );
  }
}
