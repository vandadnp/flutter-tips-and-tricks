// Want to support my work 🤝? https://buymeacoffee.com/vandad

int ascendingComparator<T extends Comparable>(T lhs, T rhs) =>
    lhs.compareTo(rhs);
int descendingComparator<T extends Comparable>(T lhs, T rhs) =>
    rhs.compareTo(lhs);

extension Sorted<T extends Comparable> on List<T> {
  List<T> sorted({bool descending = false}) => descending
      ? (this..sort(descendingComparator))
      : (this..sort(ascendingComparator));
}

class Person implements Comparable {
  final int age;
  final String name;
  const Person({required this.age, required this.name});
  @override
  int compareTo(covariant Person other) => age.compareTo(other.age);
  @override
  String toString() => 'Person, name = $name ($age)';
}

void testIt() {
  final people = [
    Person(age: 39, name: 'Father Foo'),
    Person(age: 40, name: 'Mother Bar'),
    Person(age: 13, name: 'Son Baz'),
  ];

  print('ascending sort');
  people.sorted().forEach(print);
  // prints Son Baz (13), Father Foo (39), Mother Bar (40)
  print('descending sort');
  people.sorted(descending: true).forEach(print);
  // prints Mother Bar (40), Father Foo (39), Son Baz (13)
}
