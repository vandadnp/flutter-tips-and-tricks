// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'package:flutter/cupertino.dart';

enum Season { spring, summer, autumn, winter }

extension Title on Season {
  String get title => describeEnum(this).capitalized;
}

extension Caps on String {
  String get capitalized => this[0].toUpperCase() + substring(1);
}

extension ToWidget on Season {
  Widget toWidget() {
    switch (this) {
      case Season.spring:
        return Image.network('https://cnn.it/3xu58Ap');
      case Season.summer:
        return Image.network('https://bit.ly/2VcCSow');
      case Season.autumn:
        return Image.network('https://bit.ly/3A3zStC');
      case Season.winter:
        return Image.network('https://bit.ly/2TNY7wi');
    }
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

Future<Season> _chooseSeason(
  BuildContext context,
  Season currentSeason,
) async {
  CupertinoActionSheet actionSheet(BuildContext context) {
    return CupertinoActionSheet(
      title: Text('Choose your favorite season:'),
      actions: Season.values
          .map(
            (season) => CupertinoActionSheetAction(
              onPressed: () {
                Navigator.of(context).pop(season);
              },
              child: Text(season.title),
            ),
          )
          .toList(),
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          Navigator.of(context).pop(currentSeason);
        },
        child: Text('Cancel'),
      ),
    );
  }

  return await showCupertinoModalPopup(
    context: context,
    builder: (context) => actionSheet(context),
  );
}

class _HomePageState extends State<HomePage> {
  var _season = Season.spring;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_season.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _season.toWidget(),
          TextButton(
            onPressed: () async {
              _season = await _chooseSeason(
                context,
                _season,
              );
              setState(() {});
            },
            child: Text('Choose a season'),
          ),
        ],
      ),
    );
  }
}
