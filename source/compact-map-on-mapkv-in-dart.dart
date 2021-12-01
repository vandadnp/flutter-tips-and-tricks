// Want to support my work 🤝? https://buymeacoffee.com/vandad

const foo = 'foo';
const bar = 'bar';
const baz = 'baz';

const namesAndAges = {
  foo: 20,
  bar: 25,
  baz: 18,
};

const acceptedNames = [
  foo,
  bar,
];

void testIt() {
  final acceptedAges = namesAndAges.compactMap(
    (e) => acceptedNames.contains(e.key) ? e.value : null,
  );
  acceptedAges.log(); // [20, 25]
}

extension CompactMap<T, E> on Map<T, E> {
  Iterable<V> compactMap<V>(V? Function(MapEntry<T, E>) f) sync* {
    for (final entry in entries) {
      final extracted = f(entry);
      if (extracted != null) {
        yield extracted;
      }
    }
  }
}
