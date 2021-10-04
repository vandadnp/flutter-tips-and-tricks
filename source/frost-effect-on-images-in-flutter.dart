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

final loremIpsum =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            8.0,
            0.0,
            8.0,
            0.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: images
                  .map(
                    (url) => GlossyNetworkImageWithProgress(
                      url: url,
                      title: 'Image title',
                      description: loremIpsum,
                    ),
                  )
                  .expand(
                    (image) => [
                      image,
                      SizedBox(height: 16.0),
                    ],
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class GlossyNetworkImageWithProgress extends StatefulWidget {
  final String url;
  final String title;
  final String description;

  const GlossyNetworkImageWithProgress(
      {Key? key,
      required this.url,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  _GlossyNetworkImageWithProgressState createState() =>
      _GlossyNetworkImageWithProgressState();
}

class _GlossyNetworkImageWithProgressState
    extends State<GlossyNetworkImageWithProgress>
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
    final networkImage = Image.network(
      widget.url,
      fit: BoxFit.fitHeight,
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

    return BottomGloss(
      networkImage: networkImage,
      title: widget.title,
      description: widget.description,
    );
  }
}

class BottomGloss extends StatelessWidget {
  final String title;
  final String description;

  const BottomGloss(
      {Key? key,
      required this.networkImage,
      required this.title,
      required this.description})
      : super(key: key);

  final Image networkImage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          networkImage,
          Container(
            height: 300.0,
            alignment: Alignment.bottomCenter,
            child: ClipRect(
              child: FractionallySizedBox(
                heightFactor: 0.5,
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 10.0,
                    sigmaY: 10.0,
                  ),
                  child: BottomContents(
                    title: title,
                    description: description,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomContents extends StatelessWidget {
  final String title;
  final String description;

  const BottomContents({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText(text: title),
              SizedBox(height: 8.0),
              SubTitleText(text: description),
            ],
          ),
        ),
      ),
    );
  }
}

class SubTitleText extends StatelessWidget {
  final String text;
  const SubTitleText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  final String text;
  const TitleText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 30.0,
      ),
    );
  }
}

class CustomBox extends StatelessWidget {
  final Widget child;

  const CustomBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      width: MediaQuery.of(context).size.width,
      child: child is ProgressIndicator ? Center(child: child) : child,
    );
  }
}
