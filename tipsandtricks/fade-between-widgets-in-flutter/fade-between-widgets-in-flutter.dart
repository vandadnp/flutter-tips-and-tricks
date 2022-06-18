// Want to support my work 🤝? https://buymeacoffee.com/vandad

const urls = [
  'https://bit.ly/3qYOtDm',
  'https://bit.ly/3wt11Ec',
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isShowingFirstImage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedCrossFade in Flutter'),
      ),
      body: Center(
        child: AnimatedCrossFade(
          layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  isShowingFirstImage = !isShowingFirstImage;
                });
              },
              child: AnimatedCrossFade.defaultLayoutBuilder(
                  topChild, topChildKey, bottomChild, bottomChildKey),
            );
          },
          firstChild: Image.network(urls[0]),
          secondChild: Image.network(urls[1]),
          crossFadeState: isShowingFirstImage
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: Duration(milliseconds: 400),
        ),
      ),
    );
  }
}
