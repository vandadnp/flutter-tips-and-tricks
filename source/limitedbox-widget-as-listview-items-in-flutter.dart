const images = [
  'https://bit.ly/3x7J5Qt',
  'https://bit.ly/3ywI8l6',
  'https://bit.ly/3jRSRCu',
  'https://bit.ly/36fNNj9',
  'https://bit.ly/3jOueGG',
  'https://bit.ly/3qYOtDm',
  'https://bit.ly/3wt11Ec',
  'https://bit.ly/3yvFg7X',
  'https://bit.ly/3ywzOla',
  'https://bit.ly/3wnASpW',
  'https://bit.ly/3jXSDto',
];

extension ToListItemImage on String {
  Widget toListItemImage() {
    return LimitedBox(
      maxHeight: 150.0,
      child: Image.network(
        this,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Limited Box in Flutter')),
      body: ListView(
        children: images.map((str) => str.toListItemImage()).toList(),
      ),
    );
  }
}
