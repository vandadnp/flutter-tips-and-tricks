// 🐦 Twitter:                  https://twitter.com/vandadnp
// 🔵 LinkedIn:                 https://linkedin.com/in/vandadnp
// 🎥 YouTube:                  https://youtube.com/c/vandadnp
// 💙 Free Flutter Course:      https://linktr.ee/vandadnp
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'dart:typed_data' show Uint8List;
import 'package:flutter/services.dart' show NetworkAssetBundle;
import 'dart:developer' as devtools show log;
import 'package:async/async.dart' show AsyncMemoizer;

extension Log on Object {
  void log() => devtools.log(toString());
}

@immutable
class GetImageApi {
  final String url;
  final _fetch = AsyncMemoizer<Uint8List>();

  GetImageApi({required this.url});
  Future<Uint8List> fetch() => _fetch.runOnce(
        () => NetworkAssetBundle(Uri.parse(url))
            .load(url)
            .then((byteData) => byteData.buffer.asUint8List()),
      );
}

void testIt() async {
  final api = GetImageApi(url: 'http://127.0.0.1:5500/images/1.png');
  (await api.fetch()).log(); // fetched
  (await api.fetch()).log(); // cached
}
