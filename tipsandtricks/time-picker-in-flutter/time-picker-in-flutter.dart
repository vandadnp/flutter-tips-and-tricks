// Want to support my work 🤝? https://buymeacoffee.com/vandad

class HomePage extends StatelessWidget {
  final timeOfDay = ValueNotifier<TimeOfDay?>(null);
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: timeOfDay,
      builder: (context, value, child) {
        final title = timeOfDay.value?.toString() ?? 'Time Picker in Flutter';
        return Scaffold(
          appBar: AppBar(title: Text(title)),
          body: Center(
            child: TextButton(
              onPressed: () async {
                timeOfDay.value = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  initialEntryMode: TimePickerEntryMode.input,
                );
              },
              child: const Text('Please Pick a time'),
            ),
          ),
        );
      },
    );
  }
}
