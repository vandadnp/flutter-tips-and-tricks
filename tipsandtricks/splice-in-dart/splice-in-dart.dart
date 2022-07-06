// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'dart:developer' as dev show log;

extension Log on Object {
  void log() {
    dev.log(toString());
  }
}

extension Splice<T> on List<T> {
  Iterable<T> splice(int start, int count, [List<T>? insert]) {
    final result = [...getRange(start, start + count)];
    replaceRange(start, start + count, insert ?? []);
    return result;
  }
}

final names = ['John', 'Jane', 'Mary', 'Tom'];
final cars = ['BMW', 'Audi', 'Mercedes', 'Ferrari'];

void testIt() {
  // [Jane, Mary]
  names.splice(1, 2).log();
  // [John, Tom]
  names.log();
  // [Audi, Mercedes, Ferrari]
  cars.splice(1, 3, ['Lamborghini', 'Porsche']).log();
  // [BMW, Lamborghini, Porsche]
  cars.log();
}
