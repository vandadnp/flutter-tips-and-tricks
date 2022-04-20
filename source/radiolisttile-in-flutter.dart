// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'package:flutter/material.dart';
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

enum AnimalType { dog, cat, rabbit, hamster }

extension Title on AnimalType {
  String get title => name[0].toUpperCase() + name.substring(1);
}

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favoriteAnimal = useState<AnimalType?>(null);

    return Scaffold(
      appBar: AppBar(
        title: Text("You've chosen: ${favoriteAnimal.value}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: AnimalType.values.length,
          padding: const EdgeInsets.all(6.0),
          itemBuilder: (context, index) {
            final type = AnimalType.values[index];
            return RadioListTile<AnimalType>(
              title: Text(type.title),
              value: type,
              groupValue: favoriteAnimal.value,
              onChanged: (type) {
                favoriteAnimal.value = type;
              },
            );
          },
        ),
      ),
    );
  }
}
