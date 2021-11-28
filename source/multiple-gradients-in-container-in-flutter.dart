// Want to support my work 🤝? https://buymeacoffee.com/vandad

typedef GradientContainersBuilder = Map<LinearGradient, Widget?> Function();

class GradientContainers extends StatelessWidget {
  final GradientContainersBuilder builder;

  const GradientContainers({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: builder().entries.map((mapEntry) {
        final gradient = mapEntry.key;
        final widget = mapEntry.value;
        return GradientContainer(
          gradient: gradient,
          child: widget,
        );
      }).toList(),
    );
  }
}

class GradientContainer extends StatelessWidget {
  final LinearGradient gradient;
  final Widget? child;

  const GradientContainer({Key? key, required this.gradient, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
        ),
        child: child,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainers(
        builder: () => {
          topLeftToBottomRightGradient: null,
          rightToLeftGradient: null,
          leftToRightGradinet: null,
          bottomRightGradient: Image.network('https://bit.ly/3otHHog'),
        },
      ),
    );
  }
}

const transparent = Color(0x00FFFFFF);

const topLeftToBottomRightGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xff2ac3de),
    transparent,
  ],
);

const bottomRightGradient = LinearGradient(
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
  colors: [
    Color(0xffbb9af7),
    transparent,
  ],
);

const rightToLeftGradient = LinearGradient(
  begin: Alignment.centerRight,
  end: Alignment.centerLeft,
  colors: [
    Color(0xff9ece6a),
    transparent,
  ],
);

const leftToRightGradinet = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xff7dcfff),
    transparent,
  ],
);

void main() {
  runApp(
    const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
