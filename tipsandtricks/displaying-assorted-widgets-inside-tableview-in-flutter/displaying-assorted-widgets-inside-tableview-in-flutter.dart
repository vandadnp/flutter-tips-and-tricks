const natureUrls = [
  'https://bit.ly/3dAtFwy',
  'https://bit.ly/36cHehe',
  'https://bit.ly/365uqt1',
  'https://bit.ly/3x7J5Qt',
  'https://bit.ly/3jBvJYU',
  'https://bit.ly/3yhbHHi'
];

extension ToImage on String {
  Widget toPaddedNetworkImage() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(this),
      );
}

extension ToImages on List<String> {
  List<Widget> toPaddedNetworkImages() =>
      map((str) => str.toPaddedNetworkImage()).toList();
}

extension ToTableRow on List<Widget> {
  TableRow toTableRow() => TableRow(children: this);
}

class ListPaginator<T> extends Iterable {
  final List<List<T>> list;
  ListPaginator({required List<T> input, required int itemsPerPage})
      : list = [
          for (var i = 0; i < input.length; i += itemsPerPage)
            input.getRange(i, min(input.length, i + itemsPerPage)).toList(),
        ];

  @override
  Iterator get iterator => list.iterator;
}

class HomePage extends StatelessWidget {
  final provider = ListPaginator<String>(
    input: natureUrls,
    itemsPerPage: 3,
  );
  HomePage({Key? key}) : super(key: key);

  Iterable<TableRow> getRows() sync* {
    for (final List<String> urlBatch in provider) {
      final networkImages = urlBatch.toPaddedNetworkImages();
      yield TableRow(children: networkImages);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TableView in Flutter'),
      ),
      body: SingleChildScrollView(
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
          children: getRows().toList(),
        ),
      ),
    );
  }
}
