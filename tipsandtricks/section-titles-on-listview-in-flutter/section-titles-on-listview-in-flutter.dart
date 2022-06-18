import 'package:flutter/material.dart';

final List<Section> allSections = [
  Section(
    'Spring',
    [
      'https://cnn.it/3xu58Ap',
      'https://bit.ly/3ueqqC1',
    ],
  ),
  Section(
    'Summer',
    [
      'https://bit.ly/3ojNhLc',
      'https://bit.ly/2VcCSow',
    ],
  ),
  Section(
    'Autumn',
    [
      'https://bit.ly/3ib1TJk',
      'https://bit.ly/2XSpjvq',
    ],
  ),
  Section(
    'Winter',
    [
      'https://bit.ly/3iaQNE7',
      'https://bit.ly/3AY8YE4',
    ],
  ),
];

class Section {
  final String title;
  final List<String> urls;
  const Section(this.title, this.urls);
}

extension ToWidgets on Section {
  Iterable<Widget> toNetworkImageCards() {
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 40,
          ),
        ),
      ),
      ...urls.expand(
        (url) => [
          NetworkImageCard(url: url),
          SizedBox(height: 10),
        ],
      ),
    ];
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
        child: NetworkImageWithProgress(
          url: url,
        ),
      ),
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

class CustomBox extends StatelessWidget {
  final Widget child;

  const CustomBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.0,
      width: MediaQuery.of(context).size.width,
      child: child is ProgressIndicator ? Center(child: child) : child,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          final section = allSections[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: section.toNetworkImageCards().toList(),
          );
        },
        itemCount: allSections.length,
      ),
    );
  }
}
