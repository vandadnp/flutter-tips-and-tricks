// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'dart:developer' as dev show log;

// log
extension Log on Object {
  void log() {
    dev.log(toString());
  }
}

extension CompactMap<K, V> on Map<K, V> {
  Map<K2, V2> compactMap<K2, V2>(
    MapEntry<K2, V2>? Function(MapEntry<K, V>) f,
  ) {
    final result = <K2, V2>{};
    for (final entry in entries) {
      final newEntry = f(entry);
      if (newEntry != null) {
        result[newEntry.key] = newEntry.value;
      }
    }
    return result;
  }
}

final values = {
  'first_name': 'Foo',
  'last_name': 'Bar',
  'age': 22,
};

void testIt() {
  values.compactMap((entry) {
    if (entry.key == 'age') {
      return null;
    } else {
      return MapEntry(
        entry.key.toUpperCase(),
        entry.value,
      );
    }
  }).log(); // {FIRST_NAME: Foo, LAST_NAME: Bar}
}
