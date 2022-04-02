// 🐦 Twitter:                  https://twitter.com/vandadnp
// 🔵 LinkedIn:                 https://linkedin.com/in/vandadnp
// 🎥 YouTube:                  https://youtube.com/c/vandadnp
// 💙 Free Flutter Course:      https://linktr.ee/vandadnp
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'package:async/async.dart' show RestartableTimer;
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

T returnParameter<T>(T) => T;

void testIt() async {
  final RestartableTimer timer = RestartableTimer(
    const Duration(seconds: 1),
    () {
      'Timer ticked here'.log();
    },
  );
  await for (final value in Stream.periodic(
    const Duration(seconds: 3),
    returnParameter,
  )) {
    timer.cancel();
    await Future.delayed(const Duration(seconds: 1));
    timer.reset();
  }
}
