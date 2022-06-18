const dashes = [
  'https://bit.ly/3gHlTCU',
  'https://bit.ly/3wOLO1c',
  'https://bit.ly/3cXWD9j',
  'https://bit.ly/3gT5Qk2',
];

class PageText extends StatelessWidget {
  final int current;
  final int total;

  const PageText({
    Key? key,
    required this.current,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Page ${current + 1} of $total',
      style: TextStyle(fontSize: 30.0, shadows: [
        Shadow(
          offset: Offset(0.0, 1.0),
          blurRadius: 20.0,
          color: Colors.black.withAlpha(140),
        )
      ]),
    );
  }
}

class _HomePageState extends State<HomePage> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Indicator')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (pageIndex) {
                  setState(() => _index = pageIndex);
                },
                scrollDirection: Axis.horizontal,
                itemCount: dashes.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(dashes[index]),
                      Text('Dash #${index + 1}'),
                    ],
                  );
                },
              ),
            ),
            PageText(current: _index, total: dashes.length)
          ],
        ),
      ),
    );
  }
}
