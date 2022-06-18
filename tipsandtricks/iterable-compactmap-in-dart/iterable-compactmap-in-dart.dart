// Free Flutter Course 💙 https://linktr.ee/vandadnp
// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

extension CompactMap<T> on Iterable<T?> {
  Iterable<T> compactMap<E>([
    E? Function(T?)? transform,
  ]) =>
      map(transform ?? (e) => e).where((e) => e != null).cast();
}

const list = ['Hello', null, 'World'];

void testIt() {
  list.log(); // [Hello, null, World]
  list.compactMap().log(); // [Hello, World]
  list.compactMap((e) => e?.toUpperCase()).log(); // [HELLO, WORLD]
}
