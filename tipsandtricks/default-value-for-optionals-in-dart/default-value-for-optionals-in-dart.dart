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

extension OrDefault<T> on T? {
  T get orDefault {
    final value = this;
    if (value == null) {
      return {
        int: 0,
        String: '',
        double: 0.0,
        Map: {},
      }[T] as T;
    } else {
      return value;
    }
  }
}

void printValues({
  required String? name,
  required int? age,
  required double? height,
  required Map? address,
}) {
  name.orDefault.log();
  age.orDefault.log();
  height.orDefault.log();
  address.orDefault.log();
}

void testIt() {
  printValues(
    name: 'Vandad',
    age: null,
    height: null,
    address: {
      'city': 'Brighton',
      'street': 'Brighton Street',
      'number': '1',
    },
  );
  // prints the following:
  //    Vandad
  //    0
  //    0.0
  //    {city: Brighton, street: Brighton Street, number: 1}
}
