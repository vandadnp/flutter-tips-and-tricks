// Want to support my work 🤝? https://buymeacoffee.com/vandad

class DynamicToolTipTextField extends StatelessWidget {
  final TextInputType? keyboardType;
  final ValueNotifier<String?> hint;
  final TextEditingController controller;
  const DynamicToolTipTextField({
    Key? key,
    required this.hint,
    required this.controller,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: hint,
      builder: (context, value, child) {
        return TextField(
          keyboardType: keyboardType,
          controller: controller,
          decoration: InputDecoration(
            hintText: value as String?,
          ),
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

@immutable
abstract class HasText {
  String get text;
}

enum Hint { pleaseEnterYourEmail, youForgotToEnterYourEmail }

extension GetText on Hint {
  String get text {
    switch (this) {
      case Hint.pleaseEnterYourEmail:
        return 'Please enter your email';
      case Hint.youForgotToEnterYourEmail:
        return 'You forgot to enter your email';
    }
  }
}

class _HomePageState extends State<HomePage> {
  late final ValueNotifier<String?> _hint;
  late final TextEditingController _controller;

  @override
  void initState() {
    _hint = ValueNotifier<String?>(Hint.pleaseEnterYourEmail.text);
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _hint.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueNotifier in Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DynamicToolTipTextField(
              hint: _hint,
              controller: _controller,
              keyboardType: TextInputType.emailAddress,
            ),
            TextButton(
              onPressed: () async {
                final email = _controller.text;
                if (email.trim().isEmpty) {
                  _hint.value = Hint.youForgotToEnterYourEmail.text;
                  await Future.delayed(const Duration(seconds: 2));
                  _hint.value = Hint.pleaseEnterYourEmail.text;
                }
              },
              child: const Text('Log in'),
            )
          ],
        ),
      ),
    );
  }
}
