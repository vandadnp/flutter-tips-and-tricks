// Want to support my work 🤝? https://buymeacoffee.com/vandad

class UpStatus {
  final bool isUp;
  final DateTime timestamp;
  const UpStatus(this.isUp, this.timestamp);
}

class Pling {
  final String url;
  final Duration interval;
  const Pling({
    required this.url,
    required this.interval,
  });
  Stream<UpStatus> checkIfUp() =>
      Stream.periodic(interval, (_) => DateTime.now()).asyncExpand(
        (now) => HttpClient()
            .headUrl(Uri.parse(url))
            .then((req) => req..followRedirects = false)
            .then((req) => req.close())
            .then((resp) => resp.statusCode)
            .then((statusCode) => statusCode == 200)
            .onError((error, stackTrace) => false)
            .then((isUp) => UpStatus(isUp, now))
            .asStream(),
      );
}

const oneSecond = Duration(seconds: 1);
const url = 'https://dart.dev';

extension IsOrIsNot on bool {
  String get isOrIsNot => this ? 'is' : 'is not';
}

void testIt() async {
  final pling = Pling(
    url: url,
    interval: oneSecond,
  );
  await for (final upStatus in pling.checkIfUp()) {
    final timestamp = upStatus.timestamp;
    final isUpStr = upStatus.isUp.isOrIsNot;
    print('$url $isUpStr up at $timestamp');
  }
}
