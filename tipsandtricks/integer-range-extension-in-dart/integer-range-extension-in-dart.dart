// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

extension To on int {
  Iterable<int> to(int other, [bool inclusive = true]) => other > this
      ? [for (int i = this; i < other; i++) i, if (inclusive) other]
      : [for (int i = this; i > other; i--) i, if (inclusive) other];
}

void testIt() {
  // (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
  1.to(10).log();
  // (1, 2, 3, 4, 5, 6, 7, 8, 9)
  1.to(10, false).log();
  // [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
  10.to(1).log();
  // [10, 9, 8, 7, 6, 5, 4, 3, 2]
  10.to(1, false).log();
}
