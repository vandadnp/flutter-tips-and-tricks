// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum OverlayColor { brown, orange, yellow, green, blue }

extension Color on OverlayColor {
  MaterialColor get color {
    switch (this) {
      case OverlayColor.blue:
        return Colors.blue;
      case OverlayColor.brown:
        return Colors.brown;
      case OverlayColor.green:
        return Colors.green;
      case OverlayColor.orange:
        return Colors.orange;
      case OverlayColor.yellow:
        return Colors.yellow;
    }
  }
}

extension Title on OverlayColor {
  String get title => toString().split('.').last;
}

extension ToTextButtonWithValue on OverlayColor {
  TextButtonWithValue<OverlayColor> toTextButtonWithValue(
      OnTextButtonWithValuePressed onPressed) {
    return TextButtonWithValue(
      value: this,
      onPressed: onPressed,
      child: Text(title),
    );
  }
}

typedef OnTextButtonWithValuePressed<T> = void Function(T value);

class TextButtonWithValue<T> extends StatelessWidget {
  final T value;
  final OnTextButtonWithValuePressed onPressed;
  final Widget child;
  const TextButtonWithValue({
    Key? key,
    required this.value,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed(value);
      },
      child: child,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  OverlayColor? _overlayColor;

  ColorFilter? getcolorFilter() {
    final overlayColor = _overlayColor;
    if (overlayColor == null) {
      return null;
    }
    return ColorFilter.mode(
      overlayColor.color,
      BlendMode.colorBurn,
    );
  }

  Iterable<Widget> overlayColorButtons() {
    return OverlayColor.values.map((overlayColor) {
      return Expanded(
        flex: 1,
        child: Container(
          child: overlayColor.toTextButtonWithValue(
            (value) {
              setState(() {
                _overlayColor = value;
              });
            },
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tinting Images in Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 250.0,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  colorFilter: getcolorFilter(),
                  fit: BoxFit.fitHeight,
                  image: NetworkImage('https://bit.ly/3jOueGG'),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: overlayColorButtons().toList(),
            )
          ],
        ),
      ),
    );
  }
}
