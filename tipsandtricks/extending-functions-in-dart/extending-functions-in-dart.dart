// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'dart:developer' as devtools show log;

extension ToTextButton on VoidCallback {
  TextButton toTextButton(String title) {
    return TextButton(
      onPressed: this,
      child: Text(title),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extensions in Flutter'),
      ),
      body: () {
        devtools.log('I am pressed');
      }.toTextButton('Press me'),
    );
  }
}
