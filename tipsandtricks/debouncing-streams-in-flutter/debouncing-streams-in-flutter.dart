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

class DebounceTransformer<T> extends StreamTransformerBase<T, T> {
  final Duration duration;

  final _controller = StreamController<T>.broadcast();
  DebounceTransformer(this.duration);

  @override
  Stream<T> bind(Stream<T> stream) {
    DateTime? lastTime;
    Timer? timer;
    final sub = stream.listen(
      (value) {
        timer?.cancel();
        timer = null;
        if (lastTime != null &&
            DateTime.now().difference(lastTime) > duration) {
          _controller.sink.add(value);
        } else {
          timer = Timer(duration, () {
            _controller.sink.add(value);
          });
        }
      },
    );

    _controller.onCancel = () {
      sub.cancel();
    };

    return _controller.stream;
  }
}

extension Debounce<T> on Stream<T> {
  Stream<T> debounce(
    Duration duration,
  ) =>
      transform(DebounceTransformer<T>(duration));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class DateTimeWidget extends StatelessWidget {
  final Stream<DateTime> stream;
  const DateTimeWidget({super.key, required this.stream});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream.debounce(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class _HomePageState extends State<HomePage> {
  late StreamController<DateTime> tapController;

  @override
  void initState() {
    super.initState();
    tapController = StreamController<DateTime>.broadcast();
  }

  @override
  void dispose() {
    tapController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DateTimeWidget(
                stream: tapController.stream,
              ),
              TextButton(
                onPressed: () => tapController.sink.add(
                  DateTime.now(),
                ),
                child: const Text(
                  'Press me',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
