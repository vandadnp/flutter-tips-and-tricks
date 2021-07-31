// Want to support my work 🤝? https://buymeacoffee.com/vandad

class Item {
  final Color color;
  final String text;
  final UniqueKey uniqueKey;
  Item(this.color, this.text) : uniqueKey = UniqueKey();
}

extension ToListItem on Item {
  Widget toListItem() => LimitedBox(
        key: uniqueKey,
        maxHeight: 200,
        child: Container(
          color: color,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 100,
              ),
            ),
          ),
        ),
      );
}

class _HomePageState extends State<HomePage> {
  var items = [
    Item(Colors.deepPurple, 'Foo'),
    Item(Colors.blueGrey, 'Bar'),
    Item(Colors.lightGreen, 'Baz')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reordered List View in Flutter'),
      ),
      body: ReorderableListView(
        onReorder: (oldIndex, newIndex) {
          setState(() {
            final item = items.removeAt(oldIndex);
            items.insert(newIndex, item);
          });
        },
        children: items.map((i) => i.toListItem()).toList(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
