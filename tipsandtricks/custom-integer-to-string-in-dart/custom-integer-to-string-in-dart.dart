// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

extension AsDigitToChar on int {
  String asDigitToChar() => String.fromCharCode(this + 48);
}

extension CustomToString on int {
  String convertToString() {
    var mutThis = this;
    final sign = mutThis < 0 ? '-' : '';
    mutThis = mutThis.abs();
    final digits = List<String>.empty(growable: true);
    do {
      final char = mutThis % 10;
      mutThis = mutThis ~/ 10;
      digits.insert(0, char.asDigitToChar());
    } while (mutThis > 0);
    return digits.fold(
      sign,
      (pr, e) => '$pr$e',
    );
  }
}

// instantiate a Person object
void testIt() {
  assert(1234567890.convertToString() == '1234567890');
  assert((-1207464).convertToString() == '-1207464');
  assert(3024303.convertToString() == '3024303');
  assert(0.convertToString() == '0');
  assert((-0).convertToString() == '0');
  assert(0342733.convertToString() == '342733');
}
