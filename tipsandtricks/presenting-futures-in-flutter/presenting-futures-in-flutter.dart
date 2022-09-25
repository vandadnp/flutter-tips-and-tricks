// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🦄 8+ Hours RxSwift Coursde  https://youtu.be/xBFWMYmm9ro
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

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
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

extension PresentAsyncSnapshot<E> on AsyncSnapshot<E> {
  Widget present({
    required BuildContext context,
    Widget Function(BuildContext context)? onNone,
    Widget Function(BuildContext context, E data)? onData,
    Widget Function(BuildContext, Object error, StackTrace stackTrace)? onError,
    Widget Function(BuildContext context)? onDoneWitNeitherDataNorError,
    Widget Function(BuildContext context)? onWaiting,
  }) {
    switch (connectionState) {
      case ConnectionState.none:
        return onNone?.call(context) ?? const SizedBox.shrink();
      case ConnectionState.active:
      case ConnectionState.waiting:
        return onWaiting?.call(context) ?? const CircularProgressIndicator();
      case ConnectionState.done:
        if (hasError) {
          return onError?.call(context, error!, stackTrace!) ??
              const SizedBox.shrink();
        } else if (hasData) {
          return onData?.call(context, data as E) ?? const SizedBox.shrink();
        } else {
          return onDoneWitNeitherDataNorError?.call(context) ??
              const SizedBox.shrink();
        }
    }
  }
}

Future<String> getName() => Future.delayed(
      const Duration(seconds: 2),
      () => 'John Smith',
    );

extension PresentFuture<E> on Future<E> {
  Widget present({
    Widget Function(BuildContext context)? onNone,
    Widget Function(BuildContext context, E data)? onData,
    Widget Function(BuildContext, Object error, StackTrace stackTrace)? onError,
    Widget Function(BuildContext context)? onDoneWitNeitherDataNorError,
    Widget Function(BuildContext context)? onWaiting,
  }) {
    return FutureBuilder<E>(
      future: this,
      builder: (context, snapshot) => snapshot.present(
        context: context,
        onNone: onNone,
        onData: onData,
        onError: onError,
        onDoneWitNeitherDataNorError: onDoneWitNeitherDataNorError,
        onWaiting: onWaiting,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: getName().present(
          onData: (_, name) => Text(name),
        ),
      ),
    );
  }
}
