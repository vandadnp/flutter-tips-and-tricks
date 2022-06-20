// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🦄 8+ Hours RxSwift Coursde  https://youtu.be/xBFWMYmm9ro
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

const basicInfo = {
  'name': 'Foo',
  'age': 20,
};

const address = {
  'address': 'Foo Street',
  'post_code': '1234',
};

extension Merge<K, V> on Map<K, V> {
  Map<K, V> operator |(Map<K, V> other) => {...this}..addEntries(
      other.entries,
    );
}

void testIt() {
  final allInfo = basicInfo | address;
  allInfo.log();
  // {name: Foo, age: 20, address: Foo Street, post_code: 1234}
}
