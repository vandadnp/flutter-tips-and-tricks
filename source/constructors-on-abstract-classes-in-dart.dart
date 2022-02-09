// Free Flutter Course 💙 https://linktr.ee/vandadnp
// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

enum Type { dog, cat }

abstract class CanRun {
  final Type type;
  const CanRun({required this.type});
}

class Cat extends CanRun {
  const Cat() : super(type: Type.cat);
}

class Dog extends CanRun {
  const Dog() : super(type: Type.dog);
}
