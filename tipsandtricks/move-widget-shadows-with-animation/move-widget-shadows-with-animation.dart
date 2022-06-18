// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'package:flutter/material.dart';

class ImageTransition extends AnimatedWidget {
  final String imageUrl;

  Animation<double> get shadowXOffset => listenable as Animation<double>;

  const ImageTransition(this.imageUrl, {shadowXOffset})
      : super(listenable: shadowXOffset);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: Offset(shadowXOffset.value, 20.0),
            color: Colors.black.withAlpha(100),
            spreadRadius: -10,
          )
        ],
      ),
      child: Image.network(imageUrl),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class CustomCurve extends CurveTween {
  CustomCurve() : super(curve: Curves.easeInOutSine);
  @override
  double transform(double t) {
    return (super.transform(t) - 0.5) * 25.0;
  }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = CustomCurve().animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.repeat(reverse: true);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ImageTransition(
            'https://bit.ly/3x7J5Qt',
            shadowXOffset: _animation,
          ),
        ),
      ),
    );
  }
}
