// Want to support my work 🤝? https://buymeacoffee.com/vandad

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isMovedUp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedPositioned in Flutter')),
      body: Center(
        child: GestureDetector(
          onTap: () => setState(() => isMovedUp = !isMovedUp),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Image.network('https://bit.ly/2VcCSow'),
              Text(
                'Summer 😎',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
              AnimatedPositioned(
                duration: Duration(seconds: 1),
                bottom: isMovedUp ? 140 : 10.0,
                curve: Curves.elasticInOut,
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage('https://bit.ly/3cXWD9j'),
                  backgroundColor: Colors.orange[300],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
