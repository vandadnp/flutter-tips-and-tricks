// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🦄 9+ Hours RxDart Course    https://youtu.be/xBFWMYmm9ro
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'package:flutter/material.dart';

void main() {
  runApp(
    const App(),
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

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class CustomDelegate extends SliverGridDelegateWithFixedCrossAxisCount {
  const CustomDelegate({Key? key})
      : super(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        );
}

class ImagesGridView extends StatelessWidget {
  final Iterable<String> urls;
  const ImagesGridView({Key? key, required this.urls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const CustomDelegate(),
      itemCount: images.length,
      itemBuilder: (context, index) {
        final url = images[index];
        return NetworkImage(url: url);
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Images'),
      ),
      body: const ImagesGridView(urls: images),
    );
  }
}

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
