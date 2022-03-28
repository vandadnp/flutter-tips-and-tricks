// 🐦 Twitter:                  https://twitter.com/vandadnp
// 🔵 LinkedIn:                 https://linkedin.com/in/vandadnp
// 🎥 YouTube:                  https://youtube.com/c/vandadnp
// 💙 Free Flutter Course:      https://linktr.ee/vandadnp
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

mixin FutureConvertible<T> {
  Future<T> toFuture();
}

@immutable
class LoginApi with FutureConvertible<bool> {
  @override
  Future<bool> toFuture() => Future.delayed(
        const Duration(seconds: 1),
        () => true,
      );
}

@immutable
class SignUpApi with FutureConvertible<bool> {
  @override
  Future<bool> toFuture() => Future.delayed(
        const Duration(seconds: 1),
        () => true,
      );
}

extension Flatten on Iterable<bool> {
  bool flatten() => fold(
        true,
        (lhs, rhs) => lhs && rhs,
      );
}

extension Log on Object {
  void log() => devtools.log(toString());
}

Future<bool> startup({
  required bool shouldLogin,
  required bool shouldSignUp,
}) {
  final group = FutureGroup<bool>();
  if (shouldLogin) {
    group.add(LoginApi().toFuture());
  }
  if (shouldSignUp) {
    group.add(SignUpApi().toFuture());
  }
  group.close();
  return group.future.then((bools) => bools.flatten());
}

void testIt() async {
  final success = await startup(
    shouldLogin: true,
    shouldSignUp: false,
  );
  success.log();
}
