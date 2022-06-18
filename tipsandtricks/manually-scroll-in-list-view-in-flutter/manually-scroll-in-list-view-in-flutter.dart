// Free Flutter Course 💙 https://linktr.ee/vandadnp

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePage extends StatelessWidget {
  final _controller = ItemScrollController();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing'),
      ),
      body: ScrollablePositionedList.builder(
        itemScrollController: _controller,
        itemCount: allImages.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return IndexSelector(
              count: allImages.length,
              onSelected: (index) {
                _controller.scrollTo(
                  index: index + 1,
                  duration: const Duration(milliseconds: 370),
                );
              },
            );
          } else {
            return ImageWithTitle(index: index);
          }
        },
      ),
    );
  }
}

class ImageWithTitle extends StatelessWidget {
  final int index;
  const ImageWithTitle({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Image $index',
          style: const TextStyle(fontSize: 30.0),
        ),
        Image.network(allImages.elementAt(index - 1)),
      ],
    );
  }
}

typedef OnIndexSelected = void Function(int index);

class IndexSelector extends StatelessWidget {
  final int count;
  final OnIndexSelected onSelected;
  final String prefix;
  const IndexSelector({
    Key? key,
    required this.count,
    required this.onSelected,
    this.prefix = 'Image',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: Iterable.generate(
          count,
          (index) => TextButton(
            onPressed: () {
              onSelected(index);
            },
            child: Text('$prefix ${index + 1}'),
          ),
        ).toList(),
      ),
    );
  }
}

const imageUrls = [
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
