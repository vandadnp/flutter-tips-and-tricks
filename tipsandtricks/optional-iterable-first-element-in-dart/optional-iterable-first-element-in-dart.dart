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

extension OptionalFirst<T> on Iterable<T> {
  T? get optionalFirst => isEmpty ? null : first;
}

void printName([
  String? name,
  List<String>? orFirstNameFoundInList,
]) {
  name ??= 
    orFirstNameFoundInList?.optionalFirst 
    ?? 'No name is found';
  name.log();
}

void testIt() {
  printName(); // prints 'No name is found'
  printName('Foo'); // prints Foo
  printName(null, []); // prints 'No name is found'
  printName(null, ['Bar']); // prints Bar
}
