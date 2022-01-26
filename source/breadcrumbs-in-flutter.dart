// Free Flutter Course 💙 https://linktr.ee/vandadnp

@immutable
class BreadCrumbPath {
  final String title;
  final bool isActive;
  const BreadCrumbPath({
    required this.title,
    required this.isActive,
  });
  BreadCrumbPath activated() {
    return BreadCrumbPath(
      title: title,
      isActive: true,
    );
  }

  @override
  String toString() => title;
}

class BreatCrumbPathView extends StatelessWidget {
  final BreadCrumbPath path;

  const BreatCrumbPathView({
    Key? key,
    required this.path,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final title = path.isActive ? '${path.title} →' : path.title;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Text(
        title,
        style: TextStyle(
          height: 1.0,
          fontSize: 20.0,
          color: path.isActive ? Colors.blueAccent : Colors.black,
        ),
      ),
    );
  }
}

typedef OnBreadCrumbPathTapped = void Function(BreadCrumbPath path);

class BreadCrumbView extends StatelessWidget {
  final OnBreadCrumbPathTapped onTapped;
  final Stream<List<BreadCrumbPath>> paths;
  const BreadCrumbView({
    Key? key,
    required this.paths,
    required this.onTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<BreadCrumbPath>>(
      stream: paths,
      builder: (context, snapshot) {
        final List<Widget> views;
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.active:
            final paths = snapshot.data ?? [];
            final views = paths
                .map(
                  (path) => GestureDetector(
                    onTap: () => onTapped(path),
                    child: BreatCrumbPathView(path: path),
                  ),
                )
                .toList();
            return Wrap(
              spacing: 4.0,
              children: views,
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.center,
            );
          default:
            return Wrap();
        }
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BreadCrumbPath> _paths = [];
  late final TextEditingController _textController;
  late final StreamController<List<BreadCrumbPath>> _pathsController;

  @override
  void initState() {
    _pathsController = StreamController<List<BreadCrumbPath>>.broadcast(
      onListen: () {
        _pathsController.add(_paths);
      },
    );
    _textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    _pathsController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breadcrumb in Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BreadCrumbView(
              paths: _pathsController.stream,
              onTapped: (path) async {
                await showBreadCrumbPathTappedDialog(
                  context,
                  path,
                );
              },
            ),
            TextField(
              controller: _textController,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Enter a new path here',
              ),
            ),
            TextButton(
              onPressed: () {
                _paths = [
                  ..._paths.map((p) => p.activated()),
                  BreadCrumbPath(
                    title: _textController.text,
                    isActive: false,
                  ),
                ];
                _pathsController.add(_paths);
                _textController.clear();
              },
              child: const Center(
                child: Text('Add new path'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> showBreadCrumbPathTappedDialog(
  BuildContext context,
  BreadCrumbPath path,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text('You tapped on $path'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
