// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🦄 8+ Hours RxSwift Coursde  https://youtu.be/xBFWMYmm9ro
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'dart:collection';

void testIt() {
  const notFound = 'NOT_FOUND';
  const defaultString = '';

  final myList = SafeList(
    defaultValue: defaultString,
    absentValue: notFound,
    values: ['Bar', 'Baz'],
  );

  print(myList[0]); // Bar
  print(myList[1]); // Baz
  print(myList[2]); // NOT_FOUND

  myList.length = 4;
  print(myList[3]); // ''

  myList.length = 0;
  print(myList.first); // NOT_FOUND
  print(myList.last); // NOT_FOUND
}

class SafeList<T> extends ListBase<T> {
  final List<T> _list;
  final T defaultValue;
  final T absentValue;

  SafeList({
    required this.defaultValue,
    required this.absentValue,
    List<T>? values,
  }) : _list = values ?? [];

  @override
  T operator [](int index) => index < _list.length ? _list[index] : absentValue;

  @override
  void operator []=(int index, T value) => _list[index] = value;

  @override
  int get length => _list.length;

  @override
  T get first => _list.isNotEmpty ? _list.first : absentValue;

  @override
  T get last => _list.isNotEmpty ? _list.last : absentValue;

  @override
  set length(int newValue) {
    if (newValue < _list.length) {
      _list.length = newValue;
    } else {
      _list.addAll(List.filled(newValue - _list.length, defaultValue));
    }
  }
}
