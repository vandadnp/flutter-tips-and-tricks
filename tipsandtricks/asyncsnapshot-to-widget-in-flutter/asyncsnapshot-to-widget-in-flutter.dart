// Free Flutter Course 💙 https://linktr.ee/vandadnp

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    ),
  );
}

final future = Future<String>.delayed(
  const Duration(seconds: 3),
  () => 'Hello world',
);

typedef ResolveToWidget<T> = Widget Function(
  ConnectionState connectionState,
  AsyncSnapshot<T> snapshot,
);

extension Materialize on AsyncSnapshot {
  Widget materialize(ResolveToWidget f) => f(
        connectionState,
        this,
      );
}

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hooks'),
      ),
      body: useFuture(future).materialize((connectionState, snapshot) {
        switch (connectionState) {
          case ConnectionState.done:
            return Text(snapshot.data ?? '');
          default:
            return const CircularProgressIndicator();
        }
      }),
    );
  }
}
