// Want to support my work 🤝? https://buymeacoffee.com/vandad

typedef CloseDialog = void Function();

CloseDialog showLoadingScreen({
  required BuildContext context,
  required String text,
}) {
  final dialog = AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(height: 10),
        Text(text),
      ],
    ),
  );
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => dialog,
  );

  return () => Navigator.of(context).pop();
}

void testIt(BuildContext context) async {
  final closeDialog = showLoadingScreen(
    context: context,
    text: 'Loading data...',
  );
  await Future.delayed(const Duration(seconds: 2));
  closeDialog();
}
