// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'package:flutter/foundation.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

enum Animal {
  cat(
    legs: 4,
    moreInfoUrl: 'https://en.wikipedia.org/wiki/Cat',
  ),

  kangaroo(
    legs: 2,
    moreInfoUrl: 'https://en.wikipedia.org/wiki/Kangaroo',
  );

  final int legs;
  final String moreInfoUrl;
  const Animal({
    required this.legs,
    required this.moreInfoUrl,
  });

  @override
  String toString() => {
        'legs': legs,
        'moreInfoUrl': moreInfoUrl,
      }.toString();
}

void testIt() {
  for (final animal in Animal.values) {
    animal.log();
  }
  // prints the followings
  // {legs: 4, moreInfoUrl: https://en.wikipedia.org/wiki/Cat}
  // {legs: 2, moreInfoUrl: https://en.wikipedia.org/wiki/Kangaroo}
}
