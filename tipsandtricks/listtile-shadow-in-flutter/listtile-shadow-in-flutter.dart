  // Free Flutter Course 💙 https://linktr.ee/vandadnp
// Want to support my work 🤝? https://buymeacoffee.com/vandad

enum Currency { dollars }

extension Title on Currency {
  String get title {
    switch (this) {
      case Currency.dollars:
        return '\$';
    }
  }
}

@immutable
class Item {
  final IconData icon;
  final String name;
  final double price;
  final Currency currency;

  const Item({
    required this.icon,
    required this.name,
    required this.price,
    required this.currency,
  });

  String get description => '$price${currency.title}';
}

const items = [
  Item(
    icon: Icons.camera_alt,
    name: 'Camera',
    price: 300,
    currency: Currency.dollars,
  ),
  Item(
    icon: Icons.house,
    name: 'House',
    price: 1000000,
    currency: Currency.dollars,
  ),
  Item(
    icon: Icons.watch,
    name: 'Smart Watch',
    price: 200,
    currency: Currency.dollars,
  ),
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, index) {
          return ItemTile(
            item: items[index],
          );
        },
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final Item item;
  const ItemTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          const TileBackground(),
          CustomTile(item: item),
        ],
      ),
    );
  }
}

class CustomTile extends StatelessWidget {
  final Item item;
  const CustomTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7.0),
      child: Container(
        decoration: customDecoration(),
        child: ListTile(
          leading: Icon(
            item.icon,
            color: Colors.white,
          ),
          title: Text(item.name),
          subtitle: Text(item.description),
        ),
      ),
    );
  }
}

BoxDecoration customDecoration() {
  return BoxDecoration(
    color: const Color.fromARGB(255, 0x7d, 0xcf, 0xff),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: Colors.black,
      width: 2.0,
    ),
  );
}

class TileBackground extends StatelessWidget {
  const TileBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 202, 255, 127),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Colors.black,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
