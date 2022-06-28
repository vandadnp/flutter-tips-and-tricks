// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🦄 8+ Hours RxSwift Coursde  https://youtu.be/xBFWMYmm9ro
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'dart:async';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

Future<String> apiCallWithNoError() async {
  await Future<void>.delayed(const Duration(seconds: 1));
  return 'Hello, World!';
}

Future<String> apiCallWithError() async {
  await Future<void>.delayed(const Duration(seconds: 1));
  throw 'Error';
}

void testIt() async {
  unawaited(apiCallWithNoError());
  apiCallWithError().ignore();
}
