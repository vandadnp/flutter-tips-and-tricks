// Want to support my work 🤝? https://buymeacoffee.com/vandad

extension FlatMap<T> on T? {
  E? flatMap<E>(E? Function(T) f) => this != null ? f(this!) : null;
}

AuthUser? get insteadOfThis {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    return AuthUser.fromFirebase(user);
  } else {
    return null;
  }
}

AuthUser? get doThis =>
    FirebaseAuth.instance.currentUser.flatMap((u) => AuthUser.fromFirebase(u));
