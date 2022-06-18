// Free Flutter Course 💙 https://linktr.ee/vandadnp
// Want to support my work 🤝? https://buymeacoffee.com/vandad

enum AnimalType { dog, cat }

@immutable
abstract class Animal {
  const Animal();
  factory Animal.fromType(AnimalType type) {
    switch (type) {
      case AnimalType.dog:
        return const Dog();
      case AnimalType.cat:
        return const Cat();
    }
  }
  void makeNoise();
}

@immutable
class Dog extends Animal {
  const Dog();
  @override
  void makeNoise() => 'Woof'.log();
}

@immutable
class Cat extends Animal {
  const Cat();
  @override
  void makeNoise() => 'Meow'.log();
}

void testIt() {
  final cat = Animal.fromType(AnimalType.cat);
  cat.makeNoise();
  final dog = Animal.fromType(AnimalType.dog);
  dog.makeNoise();
}
