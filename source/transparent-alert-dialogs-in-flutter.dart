TextStyle get whiteTextStyle => TextStyle(color: Colors.white);

Future<void> showTextDialog({
  required BuildContext context,
  required String text,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          side: BorderSide(
            color: Colors.white,
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
        backgroundColor: Colors.black.withAlpha(150),
        titleTextStyle: whiteTextStyle,
        contentTextStyle: whiteTextStyle,
        content: Text(text),
        actions: [
          TextButton(
            style: TextButton.styleFrom(primary: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          )
        ],
      );
    },
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rounded Corder Dialog',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network('https://bit.ly/3ywI8l6'),
          TextButton(
            onPressed: () async {
              await showTextDialog(
                context: context,
                text: 'Hello world',
              );
            },
            child: Text('Show dialog'),
          ),
        ],
      ),
    );
  }
}
