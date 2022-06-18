// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'package:flutter/material.dart';

const images = [
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

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 40.0,
            left: 10.0,
            right: 10.0,
          ),
          child: Column(
            children: images
                .map((url) => ElevatedNetworkImage(url: url))
                .expand(
                  (img) => [
                    img,
                    SizedBox(height: 30.0),
                  ],
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class ElevatedNetworkImage extends StatelessWidget {
  final String url;
  const ElevatedNetworkImage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalShape(
      color: Colors.white,
      clipper: Clipper(),
      elevation: 20.0,
      clipBehavior: Clip.none,
      shadowColor: Colors.white.withAlpha(200),
      child: CutEdges(
        child: Image.network(url),
      ),
    );
  }
}

class Clipper extends CustomClipper<Path> {
  static const variance = 0.2;
  static const reverse = 1.0 - variance;

  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0.0, size.height * Clipper.variance);
    path.lineTo(size.width * Clipper.variance, 0.0);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height * Clipper.reverse);
    path.lineTo(size.width * Clipper.reverse, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height * Clipper.variance);
    path.close;
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class CutEdges extends StatelessWidget {
  final Widget child;

  const CutEdges({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: Clipper(),
      child: child,
    );
  }
}
