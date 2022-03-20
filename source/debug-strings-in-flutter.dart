// 🐦 Twitter:                  https://twitter.com/vandadnp
// 🔵 LinkedIn:                 https://linkedin.com/in/vandadnp
// 🎥 YouTube:                  https://youtube.com/c/vandadnp
// 💙 Free Flutter Course:      https://linktr.ee/vandadnp
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

extension IfDebugging on String {
  String? get ifDebugging => kDebugMode ? this : null;
}

class LoginView extends HookWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController(
      text: 'foo@bar.com'.ifDebugging,
    );
    final passwordController = useTextEditingController(
      text: 'foobarbaz'.ifDebugging,
    );
    
    // rest of your code would be here ...
