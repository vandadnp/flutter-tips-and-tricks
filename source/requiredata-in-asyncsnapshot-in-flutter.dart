// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'dart:typed_data';

import 'package:flutter/material.dart';

@immutable
abstract class AppState {}

@immutable
class AppStateEmpty implements AppState {}

@immutable
class AppStateHasData implements AppState {
  final Uint8List data;
  const AppStateHasData(this.data);
}

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

Stream<AppState> getAppState() async* {}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: StreamBuilder<AppState>(
        initialData: AppStateEmpty(),
        stream: getAppState(),
        builder: (context, snapshot) {
          final state = snapshot.requireData;
          return Text('State is $state');
        },
      ),
    );
  }
}
