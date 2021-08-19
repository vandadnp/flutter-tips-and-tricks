// Want to support my work 🤝? https://buymeacoffee.com/vandad

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scrollable Sheet')),
      body: DraggableScrollableSheet(
        initialChildSize: 0.2,
        minChildSize: 0.2,
        maxChildSize: 0.8,
        builder: (context, scrollController) {
          return Container(
            decoration: decoration(),
            clipBehavior: Clip.antiAlias,
            child: SingleChildScrollView(
              controller: scrollController,
              child: column(),
            ),
          );
        },
      ),
    );
  }
}

const urls = [
  'https://tinyurl.com/4vtvh35h',
  'https://tinyurl.com/pujhs55w',
  'https://tinyurl.com/u5k7zueh',
];

List<Widget> imageWithLoremIpsum(String uri) => [
      Image.network(uri),
      SizedBox(height: 10),
      loremIpsum(),
      SizedBox(height: 10),
    ];

Column column() => Column(
      children: imageWithLoremIpsum(urls[0]) +
          imageWithLoremIpsum(urls[1]) +
          imageWithLoremIpsum(urls[2]),
    );

Text loremIpsum() => Text(
      'Lorem ipsum ' * 10,
      textAlign: TextAlign.center,
    );

BoxDecoration decoration() => BoxDecoration(
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      color: Colors.white70,
    );
