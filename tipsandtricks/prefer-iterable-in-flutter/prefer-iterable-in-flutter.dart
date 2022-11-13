// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🦄 8+ Hours RxSwift Coursde  https://youtu.be/xBFWMYmm9ro
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

Future<int> doHeavyComputation(int index) => Future.delayed(
      const Duration(seconds: 1),
      () {
        'Iteration ${index + 1}'.log();
        return index;
      },
    );

Future<void> testIt() async {
  for (final future in Iterable.generate(10)
      .map(
        (index) => doHeavyComputation(
          index,
        ),
      )
      .take(2)) {
    final result = await future;
    result.log();
  }
}
