// Want to support my work 🤝? https://buymeacoffee.com/vandad

@immutable
class Person {
  final String name;
  const Person(this.name);

  @override
  bool operator ==(covariant Person other) => other.name == name;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() => name;
}

const people1 = [Person('Foo'), Person('Bar'), Person('Baz')];
const people2 = [Person('Foo'), Person('Bar'), Person('Baz')];
const people3 = [Person('Bar'), Person('Bar'), Person('Baz')];
const people4 = [Person('Bar'), Person('Baz')];

extension IsEqualToIgnoringOrdering<T> on List<T> {
  bool isEqualToIgnoringOrdering(List<T> other) =>
      length == other.length &&
      {...this}.intersection({...other}).length == length;
}

void testIt() {
  assert(people1.isEqualToIgnoringOrdering(people2));
  assert(!people1.isEqualToIgnoringOrdering(people3));
  assert(!people2.isEqualToIgnoringOrdering(people3));
  assert(!people3.isEqualToIgnoringOrdering(people4));
}
