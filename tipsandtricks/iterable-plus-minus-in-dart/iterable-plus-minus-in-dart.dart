
// Free Flutter Course 💙 https://linktr.ee/vandadnp
// Want to support my work 🤝? https://buymeacoffee.com/vandad

extension AddRemoveItems<T> on Iterable<T> {
  Iterable<T> operator +(T other) => followedBy([other]);
  Iterable<T> operator -(T other) => where((element) => element != other);
}

void testIt() {
  final values = ['foo', 'bar']
    .map((e) => e.toUpperCase()) + 'BAZ';
  values.log(); // (FOO, BAR, BAZ)
  (values - 'BAZ').log(); // (FOO, BAR)
}
