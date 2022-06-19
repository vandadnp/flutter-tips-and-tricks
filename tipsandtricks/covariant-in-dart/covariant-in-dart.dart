// Want to support my work 🤝? https://buymeacoffee.com/vandad

class Person {
  final String name;
  const Person(this.name);
  @override
  bool operator ==(Object other) {
    if (other is! Person) throw ArgumentError('Was expecting a person');
    return other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

class Person {
  final String name;
  const Person(this.name);
  @override
  bool operator ==(covariant Person other) => other.name == name;

  @override
  int get hashCode => name.hashCode;
}
