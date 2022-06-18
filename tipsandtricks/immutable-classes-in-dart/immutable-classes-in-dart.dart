// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class Animal {
  final String name;
  const Animal(this.name);
}

class Cat extends Animal {
  const Cat() : super('Cindy Clawford');
}

class Dog extends Animal {
  int age;
  Dog()
      : age = 0,
        super('Bark Twain');
}
