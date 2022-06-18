// Free Flutter Course 💙 https://linktr.ee/vandadnp

const imageUrl = 'https://bit.ly/3AkZB1R';

class CenteredTight extends StatelessWidget {
  final Widget child;
  const CenteredTight({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [child],
    );
  }
}

class FullscreenImage extends StatefulWidget {
  final String imageUrl;
  const FullscreenImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<FullscreenImage> createState() => _FullscreenImageState();
}

class _FullscreenImageState extends State<FullscreenImage> {
  var shouldDisplayAppbar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: shouldDisplayAppbar ? AppBar(title: const Text('Image')) : null,
      body: GestureDetector(
        onTap: () {
          setState(() => shouldDisplayAppbar = !shouldDisplayAppbar);
        },
        child: Image.network(
          widget.imageUrl,
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Haptic Feedback in Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CenteredTight(
          child: FractionallySizedBox(
            heightFactor: 0.7,
            child: GestureDetector(
              onLongPress: () async {
                await HapticFeedback.lightImpact();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const FullscreenImage(
                        imageUrl: imageUrl,
                      );
                    },
                  ),
                );
              },
              child: Image.network(imageUrl),
            ),
          ),
        ),
      ),
    );
  }
}
