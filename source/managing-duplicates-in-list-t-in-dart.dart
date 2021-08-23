// Want to support my work 🤝? https://buymeacoffee.com/vandad

extension Duplicates<T> on List<T> {
  void addAllByAvoidingDuplicates(Iterable<T> values) =>
      replaceRange(0, length, {
        ...([...this] + [...values])
      });

  int get numberOfDuplicates => length - {...this}.length;

  bool get containsDuplicates => numberOfDuplicates > 0;

  List<T> get uniques => [
        ...{...this}
      ];

  void removeDuplicates() => replaceRange(
        0,
        length,
        uniques,
      );

  List<T> get duplicates => [
        for (var i = 0; i < length; i++)
          [...this].skip(i + 1).contains(this[i]) ? this[i] : null
      ].whereType<T>().toList();
}

void testIt() {
  final values = [3, 2, 10, 30, 40, 30, 100, 10];

  assert(values.numberOfDuplicates == 2);
  assert(values.containsDuplicates == true);

  assert(values.uniques.length == values.length - 2);
  print(values.uniques); // [3, 2, 10, 30, 40, 100]

  values.removeDuplicates();
  print(values); // [3, 2, 10, 30, 40, 100]

  assert(values.numberOfDuplicates == 0);
  assert(!values.containsDuplicates);
  assert(values.duplicates.isEmpty);

  values.addAllByAvoidingDuplicates([3, 2, 10, 200]);
  print(values); // [3, 2, 10, 30, 40, 100, 200]
  assert(values.containsDuplicates == false);
}
