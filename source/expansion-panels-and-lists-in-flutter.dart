//Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Event {
  final String title;
  final String details;
  final String imageUrl;
  bool isExpanded = false;

  Event({
    required this.title,
    required this.details,
    required this.imageUrl,
  });

  @override
  bool operator ==(covariant Event other) => title == other.title;
}

const diwaliDetails =
    '''Diwali, or Dipawali, is India's biggest and most important holiday of the year. The festival gets its name from the row (avali) of clay lamps (deepa) that Indians light outside their homes to symbolize the inner light that protects from spiritual darkness. This festival is as important to Hindus as the Christmas holiday is to Christians.''';

const halloweenDetails =
    '''Halloween or Hallowe'en, less commonly known as Allhalloween, All Hallows' Eve, or All Saints' Eve, is a celebration observed in many countries on 31 October, the eve of the Western Christian feast of All Hallows' Day.''';

final events = [
  Event(
    title: 'Diwali',
    details: diwaliDetails,
    imageUrl: 'https://bit.ly/3mGg8YW',
  ),
  Event(
    title: 'Halloween',
    details: halloweenDetails,
    imageUrl: 'https://bit.ly/3wb1w7j',
  ),
];

extension ToPanel on Event {
  ExpansionPanel toPanel() {
    return ExpansionPanel(
      headerBuilder: (context, isExpanded) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 30.0),
          ),
        );
      },
      isExpanded: isExpanded,
      body: Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.luminosity,
            ),
            image: NetworkImage(imageUrl),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              details,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.white, shadows: [
                Shadow(
                  blurRadius: 1.0,
                  offset: Offset.zero,
                  color: Colors.black,
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expansion Panels in Flutter'),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          children: events.map((e) => e.toPanel()).toList(),
          expansionCallback: (panelIndex, isExpanded) {
            setState(() {
              events[panelIndex].isExpanded = !isExpanded;
            });
          },
        ),
      ),
    );
  }
}
