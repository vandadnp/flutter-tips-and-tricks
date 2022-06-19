// Free Flutter Course 💙 https://linktr.ee/vandadnp
// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'package:async/async.dart' show StreamGroup;
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

void testIt() async {
  final streams = Iterable.generate(
    3,
    (i) => Stream.periodic(
      const Duration(seconds: 1),
      (_) => 'Stream $i: ${DateTime.now().toIso8601String()}',
    ).take(i + 1),
  );
  await for (final now in StreamGroup.merge(streams)) {
    now.log();
  }
}
