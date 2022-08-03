// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🦄 8+ Hours RxSwift Coursde  https://youtu.be/xBFWMYmm9ro
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

enum ItemType { fruit, meat, vegetable }

@immutable
class Item {
  final String name;
  final ItemType type;
  final int quanity;
  const Item(this.name, this.type, this.quanity);
  @override
  String toString() => 'Item, name = $name, type = $type';
}

const items = [
  Item('Asparagus', ItemType.vegetable, 5),
  Item('Bananas', ItemType.fruit, 5),
  Item('Goat', ItemType.meat, 5),
  Item('Cherries', ItemType.fruit, 5),
  Item('Fish', ItemType.meat, 5),
];

extension Group<T> on Iterable<T> {
  Map<K, Iterable<T>> groupBy<K>(K Function(T) key) {
    final map = <K, List<T>>{};
    for (final element in this) {
      final keyValue = key(element);
      if (!map.containsKey(keyValue)) {
        map[keyValue] = [];
      }
      map[keyValue]?.add(element);
    }
    return map;
  }
}

void testIt() {
  /*
    {
      vegetable: [
        Item, name = Asparagus, type = ItemType.vegetable
      ],
      fruit: [
        Item, name = Bananas, type = ItemType.fruit, 
        Item, name = Cherries, type = ItemType.fruit
      ], 
      meat: [
        Item, name = Goat, type = ItemType.meat, 
        Item, name = Fish, type = ItemType.meat
      ]
    }
  */
  items.groupBy((item) => item.type.name).log();
}
