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

Iterable<String> maleNames() sync* {
  yield 'John';
  yield 'Peter';
  yield 'Robert';
}

Iterable<String> femaleNames() sync* {
  yield 'Mary';
  yield 'Patricia';
  yield 'Linda';
}

Iterable<String> allNames() sync* {
  yield* maleNames();
  yield* femaleNames();
}

void testIt() {
  // (John, Peter, Robert, Mary, Patricia, Linda)
  allNames().log();
}
