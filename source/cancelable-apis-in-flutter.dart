// 🐦 Twitter:                  https://twitter.com/vandadnp
// 🔵 LinkedIn:                 https://linkedin.com/in/vandadnp
// 🎥 YouTube:                  https://youtube.com/c/vandadnp
// 💙 Free Flutter Course:      https://linktr.ee/vandadnp
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'dart:developer' as devtools show log;
import 'dart:typed_data' show Uint8List;
import 'package:flutter/services.dart' show NetworkAssetBundle, rootBundle;
import 'package:async/async.dart' show CancelableOperation;

extension Log on Object {
  void log() => devtools.log(toString());
}

extension LocalFileData on String {
  Future<Uint8List> localFileData() => rootBundle.load(this).then(
        (byteData) => byteData.buffer.asUint8List(),
      );
}

CancelableOperation<Uint8List> getImageOperation(String url) =>
    CancelableOperation.fromFuture(
      NetworkAssetBundle(Uri.parse(url))
          .load(url)
          .then((byteData) => byteData.buffer.asUint8List()),
      onCancel: () => 'images/template.png'.localFileData(),
    );

void testIt() async {
  final operation = getImageOperation('http://127.0.0.1:5500/images/1.png');
  final cancelledValue = await operation.cancel();
  final result = await operation.valueOrCancellation(cancelledValue);
  result?.log();
}
