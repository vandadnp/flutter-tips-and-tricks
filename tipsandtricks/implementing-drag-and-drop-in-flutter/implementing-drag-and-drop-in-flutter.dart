class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _imageUrl;

  bool shouldAccept(String? value) => Uri.tryParse(value ?? '') != null;

  Widget dragTargetBuilder(
    BuildContext context,
    List<String?> incoming,
    dynamic rejected,
  ) {
    final emptyContainer = Container(
      color: Colors.grey[200],
      height: 200,
      child: Center(
        child: Text('Drag an image here'),
      ),
    );

    if (incoming.isNotEmpty) {
      _imageUrl = incoming.first;
    }

    if (_imageUrl == null) {
      return emptyContainer;
    }

    try {
      final uri = Uri.parse(_imageUrl ?? '');
      return Container(
        color: Colors.grey[200],
        height: 200,
        child: Center(
          child: Image.network(uri.toString()),
        ),
      );
    } on FormatException {
      return emptyContainer;
    }
  }

  static final firstImageUrl = 'https://bit.ly/3xnoJTm';
  static final secondImageUrl = 'https://bit.ly/3hIuC78';
  final firstImage = Image.network(firstImageUrl);
  final secondImage = Image.network(secondImageUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tooltips in Flutter')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DragTarget<String>(
              onWillAccept: shouldAccept,
              builder: dragTargetBuilder,
            ),
            SizedBox(height: 10.0),
            DraggableImage(
              imageWidget: firstImage,
              imageUrl: firstImageUrl,
            ),
            SizedBox(height: 10.0),
            DraggableImage(
              imageWidget: secondImage,
              imageUrl: secondImageUrl,
            ),
          ],
        ),
      ),
    );
  }
}

class DraggableImage extends StatelessWidget {
  const DraggableImage({
    Key? key,
    required this.imageWidget,
    required this.imageUrl,
  }) : super(key: key);

  final Image imageWidget;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      data: imageUrl,
      feedback: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 30,
              color: Colors.black,
              spreadRadius: 10,
            ),
          ],
        ),
        child: imageWidget,
      ),
      child: imageWidget,
    );
  }
}
