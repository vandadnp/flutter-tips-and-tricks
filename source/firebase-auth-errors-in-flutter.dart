// 🐦 Twitter:                  https://twitter.com/vandadnp
// 🔵 LinkedIn:                 https://linkedin.com/in/vandadnp
// 🎥 YouTube:                  https://youtube.com/c/vandadnp
// 💙 Free Flutter Course:      https://linktr.ee/vandadnp
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

const authErrorMapping = {
  'user-not-found': AuthErrorUserNotFound(),
  'project-not-found': AuthErrorProjectNotFound(),
};

@immutable
abstract class AuthError {
  factory AuthError.from(FirebaseAuthException exception) =>
      authErrorMapping[exception.code.toLowerCase().trim()] ??
      const AuthErrorUnknown();
}

@immutable
class AuthErrorUnknown implements AuthError {
  const AuthErrorUnknown();
}

@immutable
class AuthErrorUserNotFound implements AuthError {
  const AuthErrorUserNotFound();
}

@immutable
class AuthErrorProjectNotFound implements AuthError {
  const AuthErrorProjectNotFound();
}
