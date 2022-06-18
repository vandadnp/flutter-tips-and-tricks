// Free Flutter Course 💙 https://linktr.ee/vandadnp

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Quotes/Dashes in Flutter'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: TextField(
          smartQuotesType: SmartQuotesType.disabled,
          smartDashesType: SmartDashesType.disabled,
          maxLines: null,
        ),
      ),
    );
  }
}
