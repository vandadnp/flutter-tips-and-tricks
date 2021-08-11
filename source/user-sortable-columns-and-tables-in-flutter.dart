// Want to support my work 🤝? https://buymeacoffee.com/vandad

class Language {
  final String name;
  final Image image;
  const Language(this.name, this.image);
  Language.dart()
      : name = 'Dart',
        image = Image.network('https://bit.ly/3yH1Ivj');
  Language.rust()
      : name = 'Rust',
        image = Image.network('https://bit.ly/3lPTqhb');
  Language.python()
      : name = 'Python',
        image = Image.network('https://bit.ly/3iCFCEP');

  Language.java()
      : name = 'Java',
        image = Image.network('https://bit.ly/3CCapJH');
  static List<Language> all = [
    Language.dart(),
    Language.rust(),
    Language.python(),
    Language.java(),
  ];
}

extension Sort on List<Language> {
  void sortByName(bool ascending) => sort((lhs, rhs) =>
      ascending ? lhs.name.compareTo(rhs.name) : rhs.name.compareTo(lhs.name));
}

List<DataRow> rows(List<Language> langs) => langs
    .map(
      (l) => DataRow(
        cells: [
          DataCell(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: l.image,
            ),
          ),
          DataCell(Text(l.name)),
        ],
      ),
    )
    .toList();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Language> _langs = Language.all..sortByName(true);
  int sortedColumnIndex = 1;
  var isSortedAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WhatsApp')),
      body: DataTable(
        sortAscending: isSortedAscending,
        sortColumnIndex: sortedColumnIndex,
        columns: [
          DataColumn(label: Text('Image')),
          DataColumn(
            label: Text('Name'),
            onSort: (columnIndex, ascending) {
              setState(() {
                sortedColumnIndex = columnIndex;
                isSortedAscending = ascending;
                _langs.sortByName(ascending);
              });
            },
          ),
        ],
        rows: rows(_langs),
      ),
    );
  }
}
