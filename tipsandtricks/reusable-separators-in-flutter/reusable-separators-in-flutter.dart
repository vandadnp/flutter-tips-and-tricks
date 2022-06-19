// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  runApp(
    const App(),
  );
}

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

Stream<String> getNames({
  required String filePath,
}) {
  final catNames = rootBundle.loadString(filePath);
  return Stream.fromFuture(catNames).transform(const LineSplitter());
}

Stream<String> getAllNames() => getNames(filePath: 'texts/cats.txt')
    .concatWith([getNames(filePath: 'texts/dogs.txt')]);

Widget separatorBuilder(_, __) => const Divider(
      color: Colors.black,
    );

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<String>>(
        future: getAllNames().toList(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final names = snapshot.requireData;
              return ListView.separated(
                separatorBuilder: separatorBuilder,
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(names[index]),
                  );
                },
              );
            default:
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }
}
