// Free Flutter Course 💙 https://linktr.ee/vandadnp
// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

void testIt() {
  final values = ['foo', 'bar', 'baz', '1.0'];

  values.fold<int>(0, (pe, e) => pe + e.length); // 12

  values.fold<String>('', (pe, e) => '$pe$e'); // foobarbaz1.0

  values.fold<Map<String, int>>(
    {},
    (pe, e) => pe..addAll(<String, int>{e: e.length}),
  ).log(); // {foo: 3, bar: 3, baz: 3, 1.0: 3}

  values.fold<double>(
    0.0,
    (pe, e) => pe + (double.tryParse(e) ?? 0.0),
  ); // 1.0
}
