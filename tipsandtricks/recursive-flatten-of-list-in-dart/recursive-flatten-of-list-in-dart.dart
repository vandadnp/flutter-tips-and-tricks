// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🦄 8+ Hours RxSwift Coursde  https://youtu.be/xBFWMYmm9ro
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

extension Flatten<T extends Object> on Iterable<T> {
  Iterable<T> flatten() {
    Iterable<T> _flatten(Iterable<T> list) sync* {
      for (final value in list) {
        if (value is List<T>) {
          yield* _flatten(value);
        } else {
          yield value;
        }
      }
    }
    return _flatten(this);
  }
}

void testIt() {
  final flat = [
    [[1, 2, 3], 4, 5],
    [6, [7, [8, 9]], 10],
    11,12
  ].flatten().log();
  // (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
}
