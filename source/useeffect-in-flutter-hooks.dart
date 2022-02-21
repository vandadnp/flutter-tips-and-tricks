// Free Flutter Course 💙 https://linktr.ee/vandadnp
// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    ),
  );
}

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final text = useState('');
    useEffect(
      () {
        void listener() {
          text.value = controller.text;
        }

        controller.addListener(listener);
        return () => controller.removeListener(listener);
      },
      [controller],
    );
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: controller,
          ),
          Text('You typed ${text.value}')
        ],
      ),
    );
  }
}
