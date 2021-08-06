// Want to support my work 🤝? https://buymeacoffee.com/vandad

const text = 'Flutter is an open-source UI software development'
    ' kit created by Google. It is used to develop cross platform applications'
    ' for Android, iOS, Linux, Mac, Windows, Google Fuchsia, '
    'and the web from a single codebase.';

const imageUrl = 'https://bit.ly/3gT5Qk2';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selectable Text in Flutter'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(imageUrl),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectableText(
              text,
              textAlign: TextAlign.center,
              showCursor: true,
              cursorColor: Colors.blue,
              toolbarOptions: ToolbarOptions(
                copy: true,
                selectAll: true,
              ),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
