// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'dart:developer' as devtools show log;

typedef Name = String;
typedef Age = int;

const Map<Name, Age> people = {
  'foo': 20,
  'bar': 30,
  'baz': 20,
};

extension Unique<K, V> on Map<K, V> {
  Map<K, V> unique() {
    Map<K, V> result = {};
    for (final value in {...values}) {
      final firstKey = keys.firstWhereOrNull((key) => this[key] == value);
      if (firstKey != null) {
        result[firstKey] = value;
      }
    }
    return result;
  }
}

void testIt() {
  final uniques = people.unique();
  devtools.log(uniques.toString());
  // prints: {foo: 20, bar: 30}
}
