// Free Flutter Course 💙 https://linktr.ee/vandadnp
// Want to support my work 🤝? https://buymeacoffee.com/vandad

@immutable
class RetryStrategy {
  final bool shouldRetry;
  final Duration waitBeforeRetry;
  const RetryStrategy({
    required this.shouldRetry,
    required this.waitBeforeRetry,
  });
}

typedef Retrier = RetryStrategy Function(String url, Object error);

class NetworkImageWithRetry extends StatelessWidget {
  final Widget loadingWidget;
  final Widget errorWidget;
  final String url;
  final Retrier retrier;

  final _controller = StreamController<Uint8List>.broadcast();

  NetworkImageWithRetry({
    Key? key,
    required this.url,
    required this.retrier,
    required this.loadingWidget,
    required this.errorWidget,
  }) : super(key: key);

  void getData() async {
    while (true == true) {
      try {
        final networkAsset = NetworkAssetBundle(Uri.parse(url));
        final loaded = await networkAsset.load(url);
        final bytes = loaded.buffer.asUint8List();
        _controller.sink.add(bytes);
        break;
      } catch (e) {
        final strategy = retrier(url, e);
        if (strategy.shouldRetry) {
          await Future.delayed(strategy.waitBeforeRetry);
        } else {
          _controller.sink.addError(e);
          break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return StreamBuilder(
      stream: _controller.stream,
      builder: (context, AsyncSnapshot<Uint8List> snapshot) {
        if (snapshot.hasError) {
          return errorWidget;
        } else {
          final data = snapshot.data;
          if (snapshot.hasData && data != null) {
            return Image.memory(data);
          } else {
            return loadingWidget;
          }
        }
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Retry'),
      ),
      body: NetworkImageWithRetry(
        url: 'https://bit.ly/3qYOtDm',
        errorWidget: const Text('Got an error!'),
        loadingWidget: const Text('Loading...'),
        retrier: (url, error) {
          return RetryStrategy(
            shouldRetry: error is! FlutterError,
            waitBeforeRetry: const Duration(seconds: 1),
          );
        },
      ),
    );
  }
}
