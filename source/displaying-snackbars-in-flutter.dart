// Want to support my work 🤝? https://buymeacoffee.com/vandad

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello world'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            final now = DateFormat('kk:mm:ss').format(DateTime.now());
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                elevation: 5.0,
                backgroundColor:
                    Colors.blue[600]!.withOpacity(0.8).withAlpha(200),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Colors.black.withOpacity(0.4),
                    width: 3.0,
                  ),
                ),
                content: Text('Some text $now'),
              ),
            );
          },
          child: Text('Show toast'),
        ),
      ),
    );
  }
}
