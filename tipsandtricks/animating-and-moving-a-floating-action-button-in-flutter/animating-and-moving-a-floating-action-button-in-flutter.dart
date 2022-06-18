class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

const List<FloatingActionButtonLocation> locations = [
  FloatingActionButtonLocation.centerDocked,
  FloatingActionButtonLocation.startDocked,
  FloatingActionButtonLocation.startFloat,
  FloatingActionButtonLocation.centerFloat,
  FloatingActionButtonLocation.endFloat,
  FloatingActionButtonLocation.endDocked
];

extension GoAround<T> on List<T> {
  T elementByGoingAround(int index) {
    final finalIndex = index >= length ? index.remainder(length) : index;
    return this[finalIndex];
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _locationIndex = 0;

  FloatingActionButtonLocation get location =>
      locations.elementByGoingAround(_locationIndex);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Floating Action Button'),
      ),
      floatingActionButtonLocation: location,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() => _locationIndex += 1);
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.yellow[600],
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.bedtime),
            label: 'Item 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarms),
            label: 'Item 2',
          )
        ],
        currentIndex: 0,
      ),
    );
  }
}
