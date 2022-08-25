// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🦄 8+ Hours RxSwift Coursde  https://youtu.be/xBFWMYmm9ro
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'dart:collection' show MapView;

import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

@immutable
class Person extends MapView<String, String> {
  final String firstName;
  final String lastName;
  Person(this.firstName, this.lastName)
      : super(
          {
            'first_name': firstName,
            'last_name': lastName,
          },
        );
}

void testIt() {
  final Map<String, dynamic> json = {
    'address': '123 Main St',
    ...Person('John', 'Doe'),
  };
  // logs the following:
  // {
  //   address: 123 Main St,
  //   first_name: John,
  //   last_name: Doe
  // }
  json.log();
}
