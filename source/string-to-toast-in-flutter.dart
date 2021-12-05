// Want to support my work 🤝? https://buymeacoffee.com/vandad

extension Toast on String {
  Future<void> showAsToast(BuildContext context,
      {required Duration duration}) async {
    final scaffold = ScaffoldMessenger.of(context);
    final controller = scaffold.showSnackBar(
      SnackBar(
        content: Text(this),
        backgroundColor: const Color(0xFF24283b),
        behavior: SnackBarBehavior.floating,
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    await Future.delayed(duration);
    controller.close();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () => 'Hello, World!'.showAsToast(
            context,
            duration: const Duration(seconds: 2),
          ),
          child: const Text('Show the snackbar'),
        ),
      ),
    );
  }
}
