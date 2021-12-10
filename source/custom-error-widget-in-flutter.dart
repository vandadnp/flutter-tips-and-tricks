// Want to support my work 🤝? https://buymeacoffee.com/vandad

class MyErrorWidget extends StatelessWidget {
  final String text;
  const MyErrorWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network('https://bit.ly/3gHlTCU'),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    bool isInDebugMode = false;
    assert(() {
      isInDebugMode = true;
      return true;
    }());
    final message = details.exception.toString();
    if (isInDebugMode) {
      return MyErrorWidget(text: message);
    } else {
      return Text(
        message,
        textAlign: TextAlign.center,
      );
    }
  };

  runApp(
    const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error Widget in Flutter'),
      ),
      body: Builder(
        builder: (context) {
          throw Exception(
              'Here is an exception that is caught by our custom Error Widget in Flutter');
        },
      ),
    );
  }
}
