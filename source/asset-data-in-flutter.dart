// 🐦 Twitter:                  https://twitter.com/vandadnp
// 🔵 LinkedIn:                 https://linkedin.com/in/vandadnp
// 🎥 YouTube:                  https://youtube.com/c/vandadnp
// 💙 Free Flutter Course:      https://linktr.ee/vandadnp
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'dart:typed_data' show Uint8List;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

extension LocalFileData on String {
  Future<Uint8List> localFileData() => rootBundle.load(this).then(
        (byteData) => byteData.buffer.asUint8List(),
      );
}

void testIt() async {
  (await 'images/template.png'.localFileData()).log();
}
