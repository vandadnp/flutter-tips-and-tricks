// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const allImages = [
  'https://bit.ly/3ywI8l6',
  'https://bit.ly/36fNNj9',
  'https://bit.ly/3jOueGG',
  'https://bit.ly/3qYOtDm',
  'https://bit.ly/3wt11Ec',
  'https://bit.ly/3yvFg7X',
  'https://bit.ly/3ywzOla',
  'https://bit.ly/3wnASpW',
  'https://bit.ly/3jXSDto',
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class ImageData {
  final Uint8List imageData;
  const ImageData(this.imageData);
}

class Images extends ChangeNotifier {
  final List<ImageData> _items = [];

  var _isLoading = false;
  bool get isLoading => _isLoading;

  UnmodifiableListView<ImageData> get items => UnmodifiableListView(_items);

  void loadNextImage() async {
    if (_items.length < allImages.length) {
      // time to load more
      _isLoading = true;
      notifyListeners();
      final imageUrl = allImages[_items.length];
      final networkAsset = NetworkAssetBundle(Uri.parse(imageUrl));
      final loaded = await networkAsset.load(imageUrl);
      final bytes = loaded.buffer.asUint8List();
      final imageData = ImageData(bytes);
      _items.insert(0, imageData);
      _isLoading = false;
      notifyListeners();
    } else {
      if (isLoading) {
        _isLoading = false;
        notifyListeners();
      }
    }
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangeNotifier in Flutter'),
        actions: [
          Consumer<Images>(
            builder: (context, value, child) {
              return IconButton(
                onPressed: () {
                  value.loadNextImage();
                },
                icon: const Icon(Icons.add_box_outlined),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<Images>(
          builder: (context, value, child) {
            final images = value.items;
            final isLoading = value.isLoading;
            return ListView.builder(
              itemBuilder: (context, index) {
                if (index == 0 && isLoading) {
                  return Center(
                    child: Column(
                      children: const [
                        CircularProgressIndicator(),
                        SizedBox(height: 16.0),
                      ],
                    ),
                  );
                } else {
                  final imageIndex = isLoading ? index - 1 : index;
                  final imageData = images[imageIndex].imageData;
                  return Column(
                    children: [
                      RoundedImageWithShadow(imageData: imageData),
                      const SizedBox(height: 16.0),
                    ],
                  );
                }
              },
              itemCount: isLoading ? images.length + 1 : images.length,
            );
          },
        ),
      ),
    );
  }
}

class RoundedImageWithShadow extends StatelessWidget {
  final Uint8List imageData;
  const RoundedImageWithShadow({Key? key, required this.imageData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: Colors.black.withAlpha(40),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Image.memory(
        imageData,
        fit: BoxFit.cover,
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: ChangeNotifierProvider(
        create: (_) => Images(),
        child: const HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
