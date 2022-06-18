// Want to support my work 🤝? https://buymeacoffee.com/vandad

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

const animationWidth = 10.0;

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TextEditingController _textController;
  late final AnimationController _animationController;
  late final Animation<double> _offsetAnim;
  final defaultHintText = 'Please enter your email here 😊';
  var _hintText = '';

  @override
  void initState() {
    _hintText = defaultHintText;
    _textController = TextEditingController();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 370),
      vsync: this,
    );
    _offsetAnim = Tween(
      begin: 0.0,
      end: animationWidth,
    ).chain(CurveTween(curve: Curves.elasticIn)).animate(
          _animationController,
        )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            _animationController.reverse();
          }
        },
      );
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shake Animation in Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AnimatedBuilder(
              animation: _offsetAnim,
              builder: (context, child) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: animationWidth,
                  ),
                  padding: EdgeInsets.only(
                    left: _offsetAnim.value + animationWidth,
                    right: animationWidth - _offsetAnim.value,
                  ),
                  child: TextField(
                    controller: _textController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: _hintText,
                    ),
                  ),
                );
              },
            ),
            TextButton(
                onPressed: () async {
                  if (_textController.text.isEmpty) {
                    setState(() {
                      _hintText = 'You forgot to enter your email 🥲';
                      _animationController.forward(from: 0.0);
                    });
                    await Future.delayed(const Duration(seconds: 3));
                    setState(() {
                      _hintText = defaultHintText;
                    });
                  }
                },
                child: const Text('Login'))
          ],
        ),
      ),
    );
  }
}
