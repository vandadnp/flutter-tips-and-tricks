// 🐦 Twitter:                  https://twitter.com/vandadnp
// 🔵 LinkedIn:                 https://linkedin.com/in/vandadnp
// 🎥 YouTube:                  https://youtube.com/c/vandadnp
// 💙 Free Flutter Course:      https://linktr.ee/vandadnp
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'dart:developer' as devtools show log;
import 'dart:collection' show ListBase;

class LowercaseList extends ListBase<String> {
  final List<String> _list = [];

  @override
  int get length => _list.length;
  @override
  set length(int newLength) => _list.length = newLength;

  @override
  String operator [](int index) => _list[index].toUpperCase();

  @override
  void operator []=(int index, value) => _list[index] = value;

  @override
  void addAll(Iterable<String> iterable) => _list.addAll(iterable);

  @override
  void add(String element) => _list.add(element);
}

extension Log on Object {
  void log() => devtools.log(toString());
}

void testIt() {
  final myList = LowercaseList();
  myList.addAll(['foo', 'bar', 'baz']);
  myList[0].log(); // FOO
  myList[1].log(); // BAR
  for (final item in myList) {
    item.log(); // FOO, BAR, BAZ
  }
}
