// 🐦 Twitter:                  https://twitter.com/vandadnp
// 🔵 LinkedIn:                 https://linkedin.com/in/vandadnp
// 🎥 YouTube:                  https://youtube.com/c/vandadnp
// 💙 Free Flutter Course:      https://linktr.ee/vandadnp
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'dart:typed_data' show Uint8List;
import 'dart:io' show HttpClient;
import 'package:flutter/foundation.dart'
    show consolidateHttpClientResponseBytes;

Future<Uint8List> getData() async {
  final request = await HttpClient().getUrl(
    Uri.parse('https://google.com'),
  );
  final response = await request.close();
  final bytes = await consolidateHttpClientResponseBytes(response);
  return bytes;
}
