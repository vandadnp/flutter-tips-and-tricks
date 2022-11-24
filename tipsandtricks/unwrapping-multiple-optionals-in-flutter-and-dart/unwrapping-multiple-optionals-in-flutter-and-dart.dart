// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🦄 8+ Hours RxSwift Coursde  https://youtu.be/xBFWMYmm9ro
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

void main(List<String> args) {
  /// unwrapping multiple optionals
  print(getFullName(null, null)); // Empty
  print(getFullName('John', null)); // Empty
  print(getFullName(null, 'Doe')); // Empty
  print(getFullName('John', 'Doe')); // John Doe
}

String getFullName(
  String? firstName,
  String? lastName,
) =>
    withAll([
      firstName,
      lastName,
    ], (names) => names.join(' ')) ??
    'Empty';

T? withAll<T>(
  List<T?> optionals,
  T Function(List<T>) callback,
) =>
    optionals.any((e) => e == null) ? null : callback(optionals.cast<T>());
