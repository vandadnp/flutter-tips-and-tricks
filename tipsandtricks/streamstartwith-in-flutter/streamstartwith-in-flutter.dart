// 🐦 Twitter:                  https://twitter.com/vandadnp
// 🔵 LinkedIn:                 https://linkedin.com/in/vandadnp
// 🎥 YouTube:                  https://youtube.com/c/vandadnp
// 💙 Free Flutter Course:      https://linktr.ee/vandadnp
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'package:async/async.dart' show StreamGroup;
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

extension StartWith<T> on Stream<T> {
  Stream<T> startWith(T value) => StreamGroup.merge([
        this,
        Stream<T>.value(value),
      ]);
}

void testIt() {
  Stream.periodic(const Duration(seconds: 1), (i) => i + 1)
      .startWith(0)
      .take(4)
      .forEach((element) {
    element.log();
  }); // 0, 1, 2, 3
}
