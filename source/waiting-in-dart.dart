// Want to support my work 🤝? https://buymeacoffee.com/vandad

Future<void> wait(Duration d) async {
  await Future.delayed(d);
}

extension Wait on int {
  Future<void> get seconds => wait(Duration(seconds: this));
  Future<void> get minutes => wait(Duration(minutes: this));
}

void testIt() async {
  await 2.seconds;
  'After 2 seconds'.log();
  await 3.minutes;
  'After 3 minutes'.log();
}

extension Log on Object {
  void log() {
    dev.log(toString());
  }
}
