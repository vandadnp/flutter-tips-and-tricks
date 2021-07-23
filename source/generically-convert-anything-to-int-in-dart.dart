extension ToInt on Object {
  int toInt() {
    final list = [
      if (this is Iterable<Object>)
        ...(List.of(this as Iterable<Object>))
      else if (this is int)
        [this as int]
      else
        (double.tryParse(toString()) ?? 0.0).round()
    ];
    return list
        .map((e) => (double.tryParse(e.toString()) ?? 0.0).round())
        .reduce((lhs, rhs) => lhs + rhs);
  }
}

void testIt() {
  assert(1.toInt() == 1);
  assert((2.2).toInt() == 2);
  assert((2.0).toInt() == 2);
  assert('3'.toInt() == 3);
  assert(['4', '5'].toInt() == 9);
  assert([4, 5].toInt() == 9);
  assert(['2.4', '3.5'].toInt() == 6);
  assert(['2', '3.5'].toInt() == 6);
  assert({'2', 3, '4.2'}.toInt() == 9);
  assert(['2', 3, '4.2', 5.3].toInt() == 14);
}
