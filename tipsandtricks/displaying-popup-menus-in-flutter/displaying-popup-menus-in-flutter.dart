enum ImageAction { copy }

PopupMenuItem<ImageAction> copyButton({VoidCallback? onPressed}) =>
    PopupMenuItem<ImageAction>(
      value: ImageAction.copy,
      child: TextButton.icon(
        icon: Icon(Icons.copy),
        label: Text('Copy'),
        onPressed: onPressed,
      ),
    );

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter'),
      ),
      body: Center(
        child: PopupMenuButton<ImageAction>(
          elevation: 10,
          offset: Offset(0, 50),
          itemBuilder: (_) => [
            copyButton(
              onPressed: () {
                print('Copy the image...');
              },
            ),
          ],
          child: Image.network('https://bit.ly/3ywI8l6'),
        ),
      ),
    );
  }
}
