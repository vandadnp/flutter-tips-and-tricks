// Want to support my work 🤝? https://buymeacoffee.com/vandad

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card in Flutter'),
      ),
      body: Image.network(
        'https://bit.ly/36fNNj9',
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          return Card(
            child: child,
            clipBehavior: Clip.antiAlias,
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          final totalBytes = loadingProgress?.expectedTotalBytes;
          final bytesLoaded = loadingProgress?.cumulativeBytesLoaded;
          if (totalBytes != null && bytesLoaded != null) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [CircularProgressIndicator()],
            );
          } else {
            return child;
          }
        },
      ),
    );
  }
}
