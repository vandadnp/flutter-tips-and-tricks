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
          Image.network(imageUrl),
        ],
      ),
    );
  }
}
