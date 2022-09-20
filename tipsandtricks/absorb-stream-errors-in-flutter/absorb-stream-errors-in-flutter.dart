// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🦄 8+ Hours RxSwift Coursde  https://youtu.be/xBFWMYmm9ro
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'dart:async';
import 'dart:developer' as devtools show log;

extension Log<T> on T? {
  void log() => devtools.log(this == null ? 'null' : toString());
}

class ErrorAbsorberTransformer<T> extends StreamTransformerBase<T, T> {
  final _controller = StreamController<T>.broadcast();
  ErrorAbsorberTransformer();

  @override
  Stream<T> bind(Stream<T> stream) {
    final sub = stream
        .handleError(
          (_) => _controller.close(),
        )
        .listen(
          _controller.sink.add,
        );
    _controller.onCancel = () {
      sub.cancel();
    };
    return _controller.stream;
  }
}

extension AbsorbErrors<T> on Stream<T> {
  Stream<T> absorbErrors() => transform(
        ErrorAbsorberTransformer(),
      );
}

Stream<String> getNames() async* {
  yield 'Vandad';
  await Future.delayed(const Duration(seconds: 1));
  yield 'John';
  await Future.delayed(const Duration(seconds: 1));
  throw 'Enough names for you';
}

Future<void> testIt() async {
  await for (final name in getNames().absorbErrors()) {
    name.log(); // Vandad, John, then stream closes
  }
}
