// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🦄 8+ Hours RxSwift Coursde  https://youtu.be/xBFWMYmm9ro
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

enum TestMe {
  vandadOnAndroid(
    text: 'This needs extra testing please',
    assignee: 'vandad.np@gmail.com',
  ),

  michaelOnBetaMac(
    text: 'Please test on latest public beta of macOS',
    assignee: 'michael@foobarbaz.com',
  );

  final String text;
  final String assignee;
  const TestMe({
    required this.text,
    required this.assignee,
  });
}

@TestMe.vandadOnAndroid
void someFunction() {
  // some statements
}

@TestMe.michaelOnBetaMac
void someOtherfunction() {
  // some statements
}
