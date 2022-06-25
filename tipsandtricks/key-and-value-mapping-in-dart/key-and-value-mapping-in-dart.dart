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

const names = {'foo': 22, 'bar': 30, 'baz': 40};

extension DetailedMap<K, V> on Map<K, V> {
  Map<R, V> mappedKeys<R>(R Function(K) f) =>
      map((key, value) => MapEntry(f(key), value));

  Map<K, R> mappedValues<R>(R Function(V) f) =>
      map((key, value) => MapEntry(key, f(value)));
}

void testIt() {
  // {foofoo: 22, barbar: 30, bazbaz: 40}
  names.mappedKeys((k) => k * 2).log();
  // {foo: 44, bar: 60, baz: 80}
  names.mappedValues((v) => v * 2).log();
}
