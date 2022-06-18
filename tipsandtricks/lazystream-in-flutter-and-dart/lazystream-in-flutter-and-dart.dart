// 🐦 Twitter:                  https://twitter.com/vandadnp
// 🔵 LinkedIn:                 https://linkedin.com/in/vandadnp
// 🎥 YouTube:                  https://youtube.com/c/vandadnp
// 💙 Free Flutter Course:      https://linktr.ee/vandadnp
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'dart:developer' as devtools show log;
import 'dart:typed_data' show Uint8List;
import 'package:flutter/services.dart' show NetworkAssetBundle, rootBundle;
import 'package:async/async.dart' show LazyStream;

extension LocalFileData on String {
  Future<Uint8List> localFileData() => rootBundle.load(this).then(
        (byteData) => byteData.buffer.asUint8List(),
      );
}

extension Log on Object {
  void log() => devtools.log(toString());
}

void testIt() async {
  final stream = LazyStream(
    () async {
      final allData = await calculateAllData();
      return getImagesData(allData);
    },
  );

  await for (final data in stream) {
    'Got data, length = ${data.length}'.log();
  }
}

Stream<Uint8List> getImagesData(
  List<Future<Uint8List>> allData,
) async* {
  for (final data in allData) {
    yield await data;
  }
}

Future<List<Future<Uint8List>>> calculateAllData() async {
  final futures = Iterable.generate(
    3,
    (i) => 'images/image_list${i + 1}.txt'
        .localFileData()
        .then((data) => String.fromCharCodes(data)),
  );
  final result = Future.wait(futures);
  final lineSplitter = const LineSplitter();
  List<Future<Uint8List>> allData = [];
  for (final string in await result) {
    final urls = lineSplitter.convert(string);
    for (final url in urls) {
      allData.add(
        NetworkAssetBundle(Uri.parse(url))
            .load(url)
            .then((byteData) => byteData.buffer.asUint8List()),
      );
    }
  }
  return allData;
}

