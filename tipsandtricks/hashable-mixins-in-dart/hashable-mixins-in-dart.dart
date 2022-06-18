// Want to support my work 🤝? https://buymeacoffee.com/vandad

enum PetType { cat, dog }

mixin Pet {
  String get name;
  int get age;
  PetType get type;
  @override
  String toString() => 'Pet ($type), name = $name, age = $age';
  @override
  int get hashCode => hashValues(name, age, type);
  @override
  bool operator ==(covariant Pet o) => o.hashCode == hashCode;
}

class Cat with Pet {
  @override
  final String name;
  @override
  final int age;
  @override
  final PetType type;
  const Cat({required this.name, required this.age}) : type = PetType.cat;
}

void testIt() {
  final cats = <Cat>{
    Cat(name: 'Kitty 1', age: 2),
    Cat(name: 'Kitty 2', age: 3),
    Cat(name: 'Kitty 1', age: 2),
  };
  cats.forEach(print);
  /* 👆🏻 prints the following:
  Pet (PetType.cat), name = Kitty 1, age = 2
  Pet (PetType.cat), name = Kitty 2, age = 3
  */
}
