// Want to support my work 🤝? https://buymeacoffee.com/vandad

extension CompactMap<T> on List<T> {
  List<E> compactMap<E>(E? Function(T element) f) {
    Iterable<E> imp(E? Function(T element) f) sync* {
      for (final value in this) {
        final mapped = f(value);
        if (mapped != null) {
          yield mapped;
        }
      }
    }

    return imp(f).toList();
  }
}

extension FlatMap<T> on T? {
  E? flatMap<E>(E? Function(T value) f) {
    if (this != null) {
      return f(this!);
    } else {
      return null;
    }
  }
}

void testIt() {
  final foo = [1, 2, null, 3, null, 4];
  final bar = foo.compactMap((element) => element.flatMap((e) => e * 2));
  print(bar); // prints 2, 4, 6, 8
}
