// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'package:flutter_test/flutter_test.dart';

extension NullExpectations on Object? {
  void expectNull() => expect(this, isNull);
  void expectNotNull() => expect(this, isNotNull);
}

extension BoolExpectations on bool {
  void expectTrue() => expect(this, true);
  void expectFalse() => expect(this, false);
}

bool boolFunction() => true;
bool otherBoolFunction() => false;
String? stringFunction() => null;
int? intFunction() => 1;

void testIt() {
  boolFunction().expectTrue();
  otherBoolFunction().expectFalse();
  stringFunction().expectNull();
  intFunction().expectNotNull();
}
