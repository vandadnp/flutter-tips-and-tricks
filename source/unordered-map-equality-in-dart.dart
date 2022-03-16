// Free Flutter Course 💙 https://linktr.ee/vandadnp
// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'package:collection/collection.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

extension UnorderedEquality<K, V> on Map<K, V> {
  bool isEqualTo(Map<K, V> other) =>
      const DeepCollectionEquality.unordered().equals(this, other);
}

void testIt() {
  final dict1 = {
    'name': 'foo',
    'age': 20,
    'values': ['foo', 'bar'],
  };
  final dict2 = {
    'age': 20,
    'name': 'foo',
    'values': ['bar', 'foo'],
  };
  dict1.isEqualTo(dict2).log(); // true
}
