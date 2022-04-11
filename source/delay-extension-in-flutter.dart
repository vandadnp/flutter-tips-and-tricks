// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

extension WithDelay<T> on T {
  Future<T> toFuture([Duration? delay]) =>
      delay != null ? Future.delayed(delay, () => this) : Future.value(this);
}

const delay = Duration(seconds: 1);

void testIt() {
  final message1 = Future.delayed(
    delay,
    () => 'Hello, world!',
  );
  final message2 = 'Hello, world!'.toFuture(delay);
  // the above two do the same thing, but with
  // different syntax
}
