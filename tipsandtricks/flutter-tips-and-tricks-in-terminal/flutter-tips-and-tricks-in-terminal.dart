// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'dart:convert' show utf8;
import 'dart:io' show HttpClient, exit, Process, stderr;
import 'dart:math' show Random;

const rawBlobRoot =
    'https://raw.githubusercontent.com/vandadnp/flutter-tips-and-tricks/main/';

void main(List<String> args) async {
  final url = Uri.https('bit.ly', '/2V1GKsC');
  try {
    final client = HttpClient();
    final images = await client
        .getUrl(url)
        .then((req) => req.close())
        .then((resp) => resp.transform(utf8.decoder).join())
        .then((body) => body.split('\n').map((e) => e.trim()))
        .then((iter) => iter.toList())
        .then((list) => list..retainWhere((s) => s.endsWith('.jpg)')))
        .then((imageList) => imageList.map((e) => e.replaceAll('![](', '')))
        .then((imageList) => imageList.map((e) => e.replaceAll(')', '')))
        .then((iter) => iter.toList());

    final found = images[Random().nextInt(images.length)];
    final result = '$rawBlobRoot$found';
    await Process.run('open', [result]);
    exit(0);
  } catch (e) {
    stderr.writeln('Could not proceed due to $e');
    exit(1);
  }
}
