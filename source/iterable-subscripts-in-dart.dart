// Free Flutter Course 💙 https://linktr.ee/vandadnp
// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'dart:developer' as devtools show log;

extension Log on Object? {
  void log() => devtools.log(toString());
}

extension Subscript<T> on Iterable<T> {
  T? operator [](int index) => length > index ? elementAt(index) : null;
}

void testIt() {
  Iterable.generate(10, (i) => i + 1)[0].log(); // 1
  Iterable.generate(1, (i) => i)[2].log(); // null
  Iterable.generate(10, (i) => i + 1)[9].log(); // 10
  Iterable.generate(0, (i) => i)[0].log(); // null
}
