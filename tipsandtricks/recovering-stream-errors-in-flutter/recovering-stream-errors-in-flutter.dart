// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🦄 8+ Hours RxSwift Coursde  https://youtu.be/xBFWMYmm9ro
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'dart:async';

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

class StreamErrorHandler<T> extends StreamTransformerBase<T, T> {
  final _controller = StreamController<T>.broadcast();
  final T? Function(Object error) onError;
  StreamErrorHandler({
    required this.onError,
  });

  @override
  Stream<T> bind(Stream<T> stream) {
    final sub = stream.handleError((error) {
      final value = onError(error);
      if (value != null) {
        _controller.sink.add(value);
      }
    }).listen(_controller.sink.add);

    _controller.onCancel = () {
      sub.cancel();
    };

    return _controller.stream;
  }
}

extension Recover<T> on Stream<T> {
  Stream<T> onErrorRecoverWith(T? Function(Object error) onError) =>
      transform(StreamErrorHandler<T>(onError: onError));
}

Stream<String> getNames() async* {
  yield 'Foo';
  yield 'Bar';
  throw Exception('Something went wrong');
}

Future<void> testIt() async {
  final names = getNames().onErrorRecoverWith(
    (error) {
      error.log();
      return 'Baz';
    },
  );

  await for (final name in names) {
    name.log(); // Foo, Bar, Baz
  }
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
