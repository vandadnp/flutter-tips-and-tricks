// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Clipboard;
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller1 = useTextEditingController(text: 'Copy this text');
    final controller2 = useTextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Clipboard in Flutter')),
      body: Column(
        children: [
          TextField(controller: controller1),
          TextField(
            controller: controller2,
            decoration: const InputDecoration(
              hintText: 'Tap here to paste automatically',
            ),
            onTap: () async {
              if (await Clipboard.hasStrings()) {
                final data = await Clipboard.getData('text/plain');
                final text = data?.text;
                if (text != null) {
                  controller2.text = text;
                }
              }
            },
          )
        ],
      ),
    );
  }
}
