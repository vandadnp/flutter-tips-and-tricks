// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🦄 8+ Hours RxSwift Coursde  https://youtu.be/xBFWMYmm9ro
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'dart:developer' as devtools show log;

extension Log on Object? {
  void log() =>
      devtools.log(this?.toString() ?? '\x1b[101m\x1b[30mNULL\x1b[0m');
}

extension Find<K, V, R> on Map<K, V> {
  R? find<T>(
    K key,
    R? Function(T value) cast,
  ) {
    final value = this[key];
    if (value != null && value is T) {
      return cast(value as T);
    } else {
      return null;
    }
  }
}

const json = {
  'name': 'Foo Bar',
  'age': 20,
};

void testIt() {
  // get the age
  final String? ageAsString = json.find(
    'age',
    (int value) => 'Your age is $value',
  );
  ageAsString.log();
  // force get the name using ! operator
  final String helloName = json.find(
    'name',
    (String name) => 'Hello, $name',
  )!;
  helloName.log();
  // non-existent key
  final String? address = json.find(
    'address',
    (String address) => 'You live at $address',
  );
  address.log();
}
