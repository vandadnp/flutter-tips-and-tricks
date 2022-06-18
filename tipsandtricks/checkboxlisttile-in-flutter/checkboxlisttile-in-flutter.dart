import 'package:flutter/material.dart';

// Want to support my work 🤝? https://buymeacoffee.com/vandad

enum Item { umbrella, coat, boots }

extension Info on Item {
  String get title {
    switch (this) {
      case Item.umbrella:
        return 'Umbrella';
      case Item.boots:
        return 'Boots';
      case Item.coat:
        return 'Jacket';
    }
  }

  String get icon {
    switch (this) {
      case Item.umbrella:
        return '☂️';
      case Item.boots:
        return '🥾';
      case Item.coat:
        return '🧥';
    }
  }
}

typedef OnChecked = void Function(bool);

class Tile extends StatelessWidget {
  final Item item;
  final bool isChecked;
  final OnChecked onChecked;
  const Tile({
    Key? key,
    required this.item,
    required this.isChecked,
    required this.onChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 100.0),
      child: Center(
        child: CheckboxListTile(
          shape: ContinuousRectangleBorder(),
          value: isChecked,
          secondary: Text(
            item.icon,
            style: TextStyle(fontSize: 30.0),
          ),
          title: Text(
            item.title,
            style: TextStyle(fontSize: 40.0),
          ),
          onChanged: (value) {
            onChecked(value ?? false);
          },
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Set<Item> _enabledItems = {};

  Widget get listView {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = Item.values[index];
        final isChecked = _enabledItems.contains(item);
        return Tile(
          isChecked: isChecked,
          item: item,
          onChecked: (isChecked) {
            setState(() {
              if (isChecked) {
                _enabledItems.add(item);
              } else {
                _enabledItems.remove(item);
              }
            });
          },
        );
      },
      itemCount: Item.values.length,
    );
  }

  Widget get title {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Remember to pick all items! It's going to be rainy today!",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 40),
      ),
    );
  }

  Widget get readyButton {
    final onPressed = () async {
      // program this
      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('You seem to be ready for a rainy day! ✅'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              )
            ],
          );
        },
      );
    };

    final isEnabled = _enabledItems.containsAll(Item.values);

    return FractionallySizedBox(
      widthFactor: 0.8,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        child: Text('Ready!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox List Tile in Flutter'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            title,
            listView,
            SizedBox(height: 50.0),
            readyButton,
          ],
        ),
      ),
    );
  }
}
