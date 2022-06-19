// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:flutter/services.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

Stream<Uint8List> getImagesData() async* {
  for (final url in images) {
    final bundle = NetworkAssetBundle(Uri.parse(url));
    final loaded = await bundle.load(url);
    final bytes = loaded.buffer.asUint8List();
    yield bytes;
  }
}

class _HomePageState extends State<HomePage> {
  late final StreamQueue<Uint8List> queue;
  final List<Uint8List> dataArray = [];
  bool isLoading = false;

  @override
  void initState() {
    queue = StreamQueue<Uint8List>(getImagesData());
    super.initState();
  }

  @override
  void dispose() {
    queue.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: queue.hasNext,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('StreamQueue in Flutter'),
            actions: [
              Visibility(
                visible: snapshot.requireData,
                child: IconButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    final imageData = await queue.next;
                    setState(() {
                      isLoading = false;
                      dataArray.add(imageData);
                    });
                  },
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
              ),
            ],
            leading: Visibility(
              visible: isLoading,
              child: const CircularProgressIndicator(),
            ),
          ),
          body: GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
            itemCount: dataArray.length,
            itemBuilder: (context, index) {
              final imageData = dataArray[index];
              return Image.memory(
                imageData,
                fit: BoxFit.cover,
              );
            },
          ),
        );
      },
    );
  }
}
