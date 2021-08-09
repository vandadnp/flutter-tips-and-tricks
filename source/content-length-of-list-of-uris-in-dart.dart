// Want to support my work 🤝? https://buymeacoffee.com/vandad

final uris = [
  Uri.parse('https://tinyurl.com/4vtvh35h'),
  Uri.parse('https://tinyurl.com/pujhs55w'),
  Uri.parse('https://tinyurl.com/u5k7zueh'),
  Uri.parse('https://tinyurl.com/x46fsy6m'),
];

extension ContentLength on Uri {
  Future<int> contentLength() => HttpClient()
      .headUrl(this)
      .then((req) => req.close())
      .then((resp) => resp.headers[HttpHeaders.contentLengthHeader])
      .then((list) => list?.first ?? '0')
      .then((value) => int.tryParse(value) ?? 0);
}

T plus<T extends num>(T lhs, T rhs) => (lhs + rhs) as T;

extension Sum<T extends num> on List<T> {
  T get sum => reduce(plus);
}

extension ContentLengths on List<Uri> {
  Future<int> contentLength() =>
      Future.wait(uris.map((e) => e.contentLength())).then((list) => list.sum);
}

void testIt() async {
  final lengthOfAllUris = await uris.contentLength();
  print('length of all URIs is $lengthOfAllUris bytes');
}
