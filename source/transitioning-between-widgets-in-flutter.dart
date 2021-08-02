// Want to support my work 🤝? https://buymeacoff.ee/vandad

enum Season { spring, summer, autumn, winter }

extension Caps on String {
  String get capitalized => this[0].toUpperCase() + substring(1);
}

extension Title on Season {
  String get title => describeEnum(this).capitalized;
}

class TitledImage {
  final String title;
  final Uri uri;
  final ValueKey key;
  const TitledImage(this.title, this.uri, this.key);

  TitledImage.spring()
      : title = Season.spring.title,
        uri = Uri.https('cnn.it', '/3xu58Ap'),
        key = ValueKey(1);

  TitledImage.summer()
      : title = Season.summer.title,
        uri = Uri.https('bit.ly', '/2VcCSow'),
        key = ValueKey(2);

  TitledImage.autumn()
      : title = Season.autumn.title,
        uri = Uri.https('bit.ly', '/3A3zStC'),
        key = ValueKey(3);

  TitledImage.winter()
      : title = Season.winter.title,
        uri = Uri.https('bit.ly', '/2TNY7wi'),
        key = ValueKey(4);
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _img = TitledImage.summer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_img.title)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            duration: Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: Image.network(
              _img.uri.toString(),
              key: _img.key,
            ),
          ),
          getButtons(),
        ],
      ),
    );
  }

  Widget getButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => setState(() => _img = TitledImage.spring()),
          child: Text(Season.spring.title),
        ),
        TextButton(
          onPressed: () => setState(() => _img = TitledImage.summer()),
          child: Text(Season.summer.title),
        ),
        TextButton(
          onPressed: () => setState(() => _img = TitledImage.autumn()),
          child: Text(Season.autumn.title),
        ),
        TextButton(
          onPressed: () => setState(() => _img = TitledImage.winter()),
          child: Text(Season.winter.title),
        ),
      ],
    );
  }
}
