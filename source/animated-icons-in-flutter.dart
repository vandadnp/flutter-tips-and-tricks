class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final Animation<double> _animation;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.repeat(reverse: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Icons in Fluter'),
      ),
      body: Center(
        child: AnimatedIcon(
          color: Colors.green[300],
          size: MediaQuery.of(context).size.width,
          icon: AnimatedIcons.search_ellipsis,
          progress: _animation,
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
