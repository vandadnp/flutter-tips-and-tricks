// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

const allNames = ['foo', 'bar', 'baz', 'qux'];

const disallowedNames = ['foo', 'qux'];

extension RemoveAll<E> on Iterable<E> {
  Iterable<E> operator -(Iterable<E> other) => where(
        (e) => !other.contains(e),
      );
}

void testIt() {
  final result = allNames - disallowedNames;
  result.log(); // bar, baz
}
