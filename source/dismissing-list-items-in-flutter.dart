const gridImages = [
  'https://bit.ly/3x7J5Qt',
  'https://bit.ly/3dLJNeD',
  'https://bit.ly/3ywI8l6',
  'https://bit.ly/3jRSRCu',
  'https://bit.ly/36fNNj9',
  'https://bit.ly/3jOueGG',
  'https://bit.ly/3qYOtDm',
  'https://bit.ly/3wt11Ec',
  'https://bit.ly/3yvFg7X',
  'https://bit.ly/3ywzOla',
  'https://bit.ly/3wnASpW',
  'https://bit.ly/3jXSDto',
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBar(),
          CustomGridView(),
          CustomListView(
            imageUrls: gridImages,
          ),
        ],
      ),
    );
  }
}

class _CustomListViewState extends State<CustomListView> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(8.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final url = widget.imageUrls[index];
            return Dismissible(
              key: ValueKey(url),
              onDismissed: (_) {
                widget.imageUrls.remove(url);
              },
              background: Container(
                color: Colors.red,
                child: FittedBox(
                  alignment: Alignment.centerRight,
                  fit: BoxFit.fitHeight,
                  child: Icon(Icons.delete, color: Colors.white),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Image.network(url),
              ),
            );
          },
          childCount: widget.imageUrls.length,
        ),
      ),
    );
  }
}

class CustomListView extends StatefulWidget {
  final List<String> imageUrls;

  const CustomListView({
    Key? key,
    required this.imageUrls,
  }) : super(key: key);

  @override
  _CustomListViewState createState() => _CustomListViewState();
}

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(8.0),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.0,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Container(
              width: 100,
              height: 100,
              child: Image.network(gridImages[index]),
            );
          },
          childCount: gridImages.length,
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.orange[300],
      forceElevated: true,
      pinned: false,
      snap: false,
      floating: true,
      expandedHeight: 172,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'Flutter',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            decoration: TextDecoration.underline,
          ),
        ),
        collapseMode: CollapseMode.parallax,
        background: Image.network('https://bit.ly/3x7J5Qt'),
      ),
    );
  }
}
