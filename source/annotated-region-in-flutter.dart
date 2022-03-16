// Free Flutter Course 💙 https://linktr.ee/vandadnp
// Want to support my work 🤝? https://buymeacoffee.com/vandad

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: Container(color: Colors.blue)),
            Expanded(child: Container(color: Colors.yellow)),
          ],
        ),
      ),
    );
  }
}
