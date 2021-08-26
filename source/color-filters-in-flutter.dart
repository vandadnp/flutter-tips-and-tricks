// Want to support my work 🤝? https://buymeacoffee.com/vandad

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Filters in Flutter!'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.orange.withOpacity(sliderValue),
              BlendMode.colorBurn,
            ),
            child: Image.network('https://tinyurl.com/4vtvh35h'),
          ),
          Slider(
            value: sliderValue,
            onChanged: (value) {
              setState(() {
                sliderValue = value;
              });
            },
          )
        ],
      ),
    );
  }
}
