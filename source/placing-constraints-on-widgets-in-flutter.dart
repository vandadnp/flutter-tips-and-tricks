// Want to support my work 🤝? https://buymeacoffee.com/vandad

const dashes = [
  'https://bit.ly/3gHlTCU',
  'https://bit.ly/3wOLO1c',
  'https://bit.ly/3cXWD9j',
  'https://bit.ly/3gT5Qk2',
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConstrainedBox in Flutter'),
      ),
      body: InteractiveViewer(
        minScale: 1.0,
        maxScale: 2.0,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: dashes
                .map(
                  (dash) => TableRow(
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: 300,
                        ),
                        child: Image.network(dash),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
