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

const ages = [100, 20, 10, 90, 40];
const names = ['Foo', 'Bar', 'Baz'];
const distances = [3.1, 10.2, 1.3, 4.2];

int isLessThan<T extends Comparable>(T a, T b) => a.compareTo(b);
int isMoreThan<T extends Comparable>(T a, T b) => b.compareTo(a);

void sort([bool ascending = true]) {
  final comparator = ascending ? isLessThan : isMoreThan;
  [...ages]..sort(comparator)..log();
  [...names]..sort(comparator)..log();
  [...distances]..sort(comparator)..log();
}

void testIt() {
  sort();
  // [10, 20, 40, 90, 100], [Bar, Baz, Foo], [1.3, 3.1, 4.2, 10.2]
  sort(false);
  // [100, 90, 40, 20, 10] [Foo, Baz, Bar], [10.2, 4.2, 3.1, 1.3]
}
