// Free Flutter Course 💙 https://linktr.ee/vandadnp

import 'dart:math' as math show Random;

extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(
        math.Random().nextInt(length),
      );
}

final colors = [Colors.blue, Colors.red, Colors.brown];

class HomePage extends StatelessWidget {
  final color = ValueNotifier<MaterialColor>(
    colors.getRandomElement(),
  );
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List.Random in Flutter'),
      ),
      body: ColorPickerButton(color: color),
    );
  }
}

class ColorPickerButton extends StatelessWidget {
  final ValueNotifier<MaterialColor> color;

  const ColorPickerButton({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Color>(
      valueListenable: color,
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CenteredTight(
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: value),
              onPressed: () {
                color.value = colors.getRandomElement();
              },
              child: const Text(
                'Change color',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
