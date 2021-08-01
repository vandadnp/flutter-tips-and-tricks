// Want to support my work 🤝? https://buymeacoffee.com/vandad

class Person extends LinkedListEntry<Person> {
  final String name;
  final int age;
  Person({
    required this.name,
    required this.age,
  });

  @override
  String toString() => 'Person name = $name, age = $age';
}

void testIt() {
  final persons = LinkedList<Person>();
  final dad = Person(name: 'Father Foo', age: 47);
  final mom = Person(name: 'Mother Bar', age: 47);
  final daughter = Person(name: 'Daughter Baz', age: 22);
  persons.addAll([dad, mom, daughter]);

  print(persons.first.previous); // null
  print(persons.first); // Person name = Father Foo, age = 47
  print(persons.first.next); // Person name = Mother Bar, age = 47
  print(persons.last.previous); // Person name = Mother Bar, age = 47
  print(persons.first.next?.next); // Person name = Daughter Baz, age = 22
  print(persons.last.next); // null
}
