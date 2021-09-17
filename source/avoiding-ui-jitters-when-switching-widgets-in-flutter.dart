// Want to support my work 😎? https://buymeacoffee.com/vandad

const imageUrls = [
  'https://cnn.it/3xu58Ap', // spring
  'https://bit.ly/2VcCSow', // summer
  'https://bit.ly/3A3zStC', // autumn
  'https://bit.ly/2TNY7wi' // winter
];

extension ToNetworkImage<T extends String> on List<T> {
  List<Widget> toNetworkImages() => map((s) => Image.network(s)).toList();
}

class HomePage extends StatefulWidget {
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Indexed Stack')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IndexedStack(
              index: _currentIndex,
              children: imageUrls.toNetworkImages(),
            ),
            TextButton(
              onPressed: () {
                setState(
                  () {
                    _currentIndex++;
                    if (_currentIndex >= imageUrls.length) {
                      _currentIndex = 0;
                    }
                  },
                );
              },
              child: Text('Go to next season'),
            )
          ],
        ),
      ),
    );
  }
}
