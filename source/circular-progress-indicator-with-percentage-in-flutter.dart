//Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SizedCircularProgressIndicator extends StatelessWidget {
  final double progress;
  final double width;
  final double height;
  final TextStyle? textStyle;
  const SizedCircularProgressIndicator({
    Key? key,
    this.textStyle,
    required this.progress,
    required this.width,
    required this.height,
  }) : super(key: key);

  TextStyle get style => textStyle ?? TextStyle(fontSize: 30.0);
  int get _progress => (progress * 100.0).toInt();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Text('$_progress%', style: style),
        SizedBox(
          width: width,
          height: height,
          child: CircularProgressIndicator(
            backgroundColor: Colors.white70,
            value: progress,
            color: Colors.blueAccent,
            strokeWidth: 3.0,
          ),
        ),
      ],
    );
  }
}

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
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return WithBlurredBackground(imageUrl: images[index]);
        },
      ),
    );
  }
}

class WithBlurredBackground extends StatelessWidget {
  final String imageUrl;

  const WithBlurredBackground({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.passthrough,
        children: [
          SizedBox.expand(
            child: ClipRect(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: 10.0,
                  sigmaY: 10.0,
                ),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          NetworkImageWithProgress(url: imageUrl),
        ],
      ),
    );
  }
}

class NetworkImageWithProgress extends StatelessWidget {
  final String url;

  const NetworkImageWithProgress({Key? key, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      loadingBuilder: (context, child, loadingProgress) {
        final totalBytes = loadingProgress?.expectedTotalBytes;
        final bytesLoaded = loadingProgress?.cumulativeBytesLoaded;
        if (totalBytes != null && bytesLoaded != null) {
          return SizedCircularProgressIndicator(
            height: 100,
            width: 100,
            progress: bytesLoaded / totalBytes,
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
