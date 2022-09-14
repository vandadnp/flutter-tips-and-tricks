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

extension FlatThen<E> on Future<Iterable<E>> {
  Future<Iterable<R>> flatThen<R>(R Function(E) mapper) =>
      then((iterable) => iterable.map(mapper));
}

Future<Iterable<String>> getNames() => Future.delayed(
      const Duration(seconds: 2),
      () => ['Vandad', 'John', 'Joe'],
    );

Future<Iterable<int>> getNameLengthsWithoutFlatThen() => getNames().then(
      (names) => names.map((name) => name.length),
    );

Future<Iterable<int>> getNameLengths() => getNames().flatThen(
      (name) => name.length,
    );

Future<void> testIt() async {
  (await getNameLengthsWithoutFlatThen()).log(); // (6, 4, 3)
  (await getNameLengths()).log(); // (6, 4, 3)
}
