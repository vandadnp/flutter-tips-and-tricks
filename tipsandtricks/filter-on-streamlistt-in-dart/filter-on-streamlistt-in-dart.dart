// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'dart:developer' as devtools show log;

extension Filter<T> on Stream<List<T>> {
  Stream<List<T>> filter(bool Function(T) where) =>
      map((items) => items.where(where).toList());
}

final Stream<List<int>> allNumbers = Stream.periodic(
  const Duration(seconds: 1),
  (value) => [for (var i = 0; i < value; i++) i],
);

bool isEven(num value) => value % 2 == 0;
bool isOdd(num value) => value % 2 != 0;

extension EvenOdd<E extends num> on Stream<List<E>> {
  Stream<List<E>> get evenNumbers => filter(isEven);
  Stream<List<E>> get oddNumbers => filter(isOdd);
}

void readEvenNumbers() async {
  await for (final evenNumber in allNumbers.evenNumbers) {
    devtools.log('All even numbers: $evenNumber');
  }
}

void readOddNumbers() async {
  await for (final oddNumber in allNumbers.oddNumbers) {
    devtools.log('All odd numbers: $oddNumber');
  }
}
