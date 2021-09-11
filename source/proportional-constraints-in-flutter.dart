// Want to support my work 🤝? https://buymeacoffee.com/vandad

class ProportionalWidthNetworkImage extends StatelessWidget {
  final String url;
  final double widthProportion;

  const ProportionalWidthNetworkImage(
      {Key? key, required this.url, required this.widthProportion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Image.network(
          url,
          loadingBuilder: (context, child, loadingProgress) {
            final widget =
                loadingProgress == null ? child : LinearProgressIndicator();
            return Container(
              width: constraints.maxWidth * widthProportion,
              child: widget,
            );
          },
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ProportionalWidthNetworkImage(
          url: 'https://cnn.it/3xu58Ap',
          widthProportion: 0.8,
        ),
      ),
    );
  }
}
