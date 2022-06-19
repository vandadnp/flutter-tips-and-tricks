// Free Flutter Course 💙 https://linktr.ee/vandadnp

extension Hardcoded on String {
  String get hardcoded => '$this 🧨';
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My hardcoded string'.hardcoded,
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('String in body'.hardcoded),
        ],
      ),
    );
  }
}
