// 🐦 Twitter:                  https://twitter.com/vandadnp
// 🔵 LinkedIn:                 https://linkedin.com/in/vandadnp
// 🎥 YouTube:                  https://youtube.com/c/vandadnp
// 💙 Free Flutter Course:      https://linktr.ee/vandadnp
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

extension Flatten on Iterable<bool> {
  bool flatten() => fold(
        true,
        (lhs, rhs) => lhs && rhs,
      );
}

void testIt() {
  assert([true, false, true].flatten() == false);
  assert([true, true, true].flatten() == true);
  assert([false, false, false].flatten() == false);
  assert([true].flatten() == true);
  assert([false].flatten() == false);
}
