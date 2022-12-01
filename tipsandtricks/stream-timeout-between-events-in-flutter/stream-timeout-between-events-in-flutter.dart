// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 🤝 Want to support my work?  https://youtube.com/c/vandadnp/join/

// import 'package:flutter/material.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

void main() {
  runApp(
    const App(),
  );
}

extension Log on Object {
  void log() => devtools.log(toString());
}

class TimeoutBetweenEvents<E> extends StreamTransformerBase<E, E> {
  final Duration duration;

  const TimeoutBetweenEvents({required this.duration});

  @override
  Stream<E> bind(Stream<E> stream) {
    StreamController<E>? controller;
    StreamSubscription? subscription;
    Timer? timer;

    controller = StreamController(
      onListen: () {
        subscription = stream.listen(
          (data) {
            timer?.cancel();
            timer = Timer.periodic(duration, (_) {
              controller?.addError(
                TimeoutBetweenEventsException('Timeout'),
              );
            });
            controller?.add(data);
          },
          onError: controller?.addError,
          onDone: controller?.close,
        );
      },
      onCancel: () {
        subscription?.cancel();
        timer?.cancel();
      },
    );

    return controller.stream;
  }
}

class TimeoutBetweenEventsException implements Exception {
  final String message;
  TimeoutBetweenEventsException(this.message);
}

extension WithTimeoutBetweenEvents<T> on Stream<T> {
  Stream<T> withTimeoutBetweenEvents(Duration duration) =>
      transform(TimeoutBetweenEvents(duration: duration));
}

Stream<String> getNames() async* {
  yield 'John';
  await Future.delayed(const Duration(seconds: 1));
  yield 'Jane';
  await Future.delayed(const Duration(seconds: 10));
  yield 'Doe';
}

Future<void> testIt() async {
  await for (final name in getNames().withTimeoutBetweenEvents(
    const Duration(
      seconds: 3,
    ),
  )) {
    name.log();
  }
}

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
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
