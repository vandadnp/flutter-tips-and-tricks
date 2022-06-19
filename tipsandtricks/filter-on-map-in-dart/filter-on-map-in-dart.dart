// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'dart:developer' as devtools show log;

typedef Name = String;
typedef Age = int;

extension Filter<K, V> on Map<K, V> {
  Iterable<MapEntry<K, V>> filter(
    bool Function(MapEntry<K, V> entry) f,
  ) sync* {
    for (final entry in entries) {
      if (f(entry)) {
        yield entry;
      }
    }
  }
}

const Map<Name, Age> people = {
  'foo': 20,
  'bar': 31,
  'baz': 25,
  'qux': 32,
};

void testIt() async {
  final peopleOver30 = people.filter((e) => e.value > 30);
  devtools.log(peopleOver30.toString());
  // ☝🏻 prints (MapEntry(bar: 31), MapEntry(qux: 32))
}
