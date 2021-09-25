// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  final Widget child;

  const CustomBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.0,
      width: MediaQuery.of(context).size.width,
      child: Center(child: child),
    );
  }
}

class NetworkImageWithProgress extends StatefulWidget {
  final String url;

  const NetworkImageWithProgress({Key? key, required this.url})
      : super(key: key);

  @override
  _NetworkImageWithProgressState createState() =>
      _NetworkImageWithProgressState();
}

class _NetworkImageWithProgressState extends State<NetworkImageWithProgress>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Image.network(
      widget.url,
      fit: BoxFit.fitWidth,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        _controller.reset();
        _controller.forward();
        return FadeTransition(
          opacity: _animation,
          child: CustomBox(
            child: child,
          ),
        );
      },
      loadingBuilder: (context, child, loadingProgress) {
        final totalBytes = loadingProgress?.expectedTotalBytes;
        final bytesLoaded = loadingProgress?.cumulativeBytesLoaded;
        if (totalBytes != null && bytesLoaded != null) {
          return CustomBox(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white70,
              value: bytesLoaded / totalBytes,
              color: Colors.blue[900],
              strokeWidth: 5.0,
            ),
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

final images = [
  'https://bit.ly/3x7J5Qt',
  'https://bit.ly/3ywI8l6',
  'https://bit.ly/36fNNj9',
  'https://bit.ly/3jOueGG',
  'https://bit.ly/3wt11Ec',
  'https://bit.ly/3ywzOla',
].map((url) => NetworkImageWithProgress(url: url)).expand(
      (element) => [
        element,
        SizedBox(
          height: 10.0,
        )
      ],
    );

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: images.toList(),
        ),
      ),
    );
  }
}
