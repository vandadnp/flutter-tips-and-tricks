// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ListItem {
  const ListItem();
  factory ListItem.emptyTile() => EmptyTile();
  factory ListItem.tile(
    String title,
    String subTitle,
  ) =>
      Tile(
        title,
        subTitle,
      );
}

class Tile extends ListItem {
  final String title;
  final String subTitle;
  const Tile(this.title, this.subTitle) : super();
}

class EmptyTile extends ListItem {}

final items = [
  for (var i = 1; i <= 6; i++) ListItem.tile('Title $i', 'Sub title $i'),
  ListItem.emptyTile(),
  for (var i = 7; i <= 12; i++) ListItem.tile('Title $i', 'Sub title $i'),
];

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: NetworkImage('https://bit.ly/3jXSDto'),
        ),
      ),
      child: child,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            if (item is Tile) {
              return Container(
                color: Colors.grey[200],
                child: ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.subTitle),
                ),
              );
            } else if (item is EmptyTile) {
              return SizedBox(
                height: 450,
              );
            } else {
              throw 'unexpcted item';
            }
          },
        ),
      ),
    );
  }
}
