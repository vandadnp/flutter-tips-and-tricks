// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'dart:developer' as dev show log;

@immutable
abstract class UserException implements Exception {}

class InvalidUserNameException extends UserException {}

class InvalidUserAgeException extends UserException {}

@immutable
class User {
  final String name;
  final int age;
  User({required this.name, required this.age}) {
    if (!name.contains(RegExp(r'^[a-z ]+$'))) {
      throw InvalidUserNameException();
    } else if (age < 0 || age > 130) {
      throw InvalidUserAgeException();
    }
  }
  const User.anonymous()
      : name = 'Anonymous User',
        age = 0;
}

Future<User> getAsyncUser() => Future.delayed(
      const Duration(seconds: 1),
      () => User(name: 'Foo', age: 20),
    );

void testIt() async {
  final user = await getAsyncUser()
      .catchError(
        handleInvalidUsernameException,
        test: (e) => e is InvalidUserNameException,
      )
      .catchError(
        handleInvalidAgeException,
        test: (e) => e is InvalidUserAgeException,
      );
  dev.log(user.toString());
}

User handleInvalidUsernameException(Object? e) {
  dev.log(e.toString());
  return const User.anonymous();
}

User handleInvalidAgeException(Object? e) {
  dev.log(e.toString());
  return const User.anonymous();
}
