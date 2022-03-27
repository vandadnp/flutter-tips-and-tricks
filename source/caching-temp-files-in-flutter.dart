// 🐦 Twitter:                  https://twitter.com/vandadnp
// 🔵 LinkedIn:                 https://linkedin.com/in/vandadnp
// 🎥 YouTube:                  https://youtube.com/c/vandadnp
// 💙 Free Flutter Course:      https://linktr.ee/vandadnp
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

@immutable
class NetworkImageAsset {
  final String localPath;
  final String url;
  NetworkImageAsset({required int index})
      : localPath = Directory.systemTemp.path + '/$index.png',
        url = 'http://127.0.0.1:5500/images/$index}.png';

  Future<bool> downloadAndSave() => NetworkAssetBundle(Uri.parse(url))
      .load(url)
      .then((byteData) => byteData.buffer.asUint8List())
      .then((data) => File(localPath).writeAsBytes(data).then((_) => true))
      .catchError((_) => false);
}

void testIt() async {
  await Future.forEach(
    Iterable.generate(
      3,
      (i) => NetworkImageAsset(index: i + 1),
    ),
    (NetworkImageAsset asset) => asset.downloadAndSave(),
  );
}
