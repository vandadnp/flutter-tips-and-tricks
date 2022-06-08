// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

const images = [
  'https://bit.ly/3x7J5Qt',
  'https://bit.ly/3ywI8l6',
  'https://bit.ly/3jOueGG',
  'https://bit.ly/3qYOtDm',
  'https://bit.ly/3wt11Ec',
  'https://bit.ly/3yvFg7X',
  'https://bit.ly/3ywzOla',
  'https://bit.ly/3wnASpW',
  'https://bit.ly/3jXSDto',
];

class NetworkImage extends StatelessWidget {
  final String url;
  const NetworkImage({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class Animator extends FloatingActionButtonAnimator {
  @override
  Offset getOffset({
    required Offset begin,
    required Offset end,
    required double progress,
  }) {
    final x = begin.dx + (end.dx - begin.dx) * progress;
    final y = begin.dy + (end.dy - begin.dy) * progress;
    return Offset(
      x,
      y,
    );
  }

  @override
  Animation<double> getRotationAnimation({
    required Animation<double> parent,
  }) {
    return CurvedAnimation(
      curve: Curves.easeInOutSine,
      parent: parent,
    );
  }

  @override
  Animation<double> getScaleAnimation({
    required Animation<double> parent,
  }) {
    return CurvedAnimation(
      curve: Curves.easeInOutSine,
      parent: parent,
    );
  }
}

class _HomePageState extends State<HomePage> {
  late final ScrollController _controller;
  var _fabLocation = FloatingActionButtonLocation.endFloat;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.position.atEdge && _controller.position.pixels != 0.0) {
        _moveFabToTop();
      } else {
        _moveFabToBottom();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _moveFabToTop() {
    if (_fabLocation != FloatingActionButtonLocation.endTop) {
      setState(() {
        _fabLocation = FloatingActionButtonLocation.endTop;
      });
    }
  }

  void _moveFabToBottom() {
    if (_fabLocation != FloatingActionButtonLocation.endFloat) {
      setState(() {
        _fabLocation = FloatingActionButtonLocation.endFloat;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Floating Action Button',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: _fabLocation,
      floatingActionButtonAnimator: Animator(),
      body: ImageList(
        controller: _controller,
      ),
    );
  }
}

class ImageList extends StatelessWidget {
  const ImageList({
    Key? key,
    required ScrollController controller,
  })  : _controller = controller,
        super(key: key);

  final ScrollController _controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _controller,
      itemCount: images.length,
      itemBuilder: (context, index) {
        final url = images.elementAt(index);
        return SizedBox(
          height: 200,
          child: NetworkImage(
            url: url,
          ),
        );
      },
    );
  }
}
