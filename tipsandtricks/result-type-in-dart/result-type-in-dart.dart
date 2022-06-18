// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
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

enum ResultType { value, error }

@immutable
class Result<T, E> {
  final T? value;
  final E? error;
  final ResultType type;
  const Result.error({required E input})
      : error = input,
        value = null,
        type = ResultType.error;
  const Result.value({required T input})
      : value = input,
        error = null,
        type = ResultType.value;
  E get requireError => error!;
  T get requireValue => value!;

  @override
  String toString() {
    switch (type) {
      case ResultType.value:
        return 'Value = ${requireValue.toString()}';
      case ResultType.error:
        return 'Error = ${requireError.toString()}';
    }
  }
}

void testIt() {
  const valueResult = Result.value(input: 10);
  valueResult.log(); // Value = 10
  valueResult.value?.log(); // 10
  valueResult.error?.log(); // no log occurs
  const errorResult = Result.error(input: 404);
  errorResult.log(); // Error = 404
  errorResult.value?.log(); // no logs occur
  errorResult.error?.log(); // 404
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    testIt();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
    );
  }
}
