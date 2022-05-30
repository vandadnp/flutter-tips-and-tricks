// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🦄 9+ Hours RxDart Course    https://youtu.be/xBFWMYmm9ro
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    ),
  );
}

enum EmailProvider {
  gmail('gmail.com', 'G', Colors.red, Colors.white),
  yahoo('yahoo.com', 'Y', Colors.purple, Colors.white),
  hotmail('hotmail.com', 'H', Colors.orange, Colors.white);

  final String name;
  final String title;
  final Color backgroundColor;
  final Color foregroundColor;

  const EmailProvider(
    this.name,
    this.title,
    this.backgroundColor,
    this.foregroundColor,
  );
}

extension WithAtSign on String {
  String get withAtSign => '@$this';
}

extension IsEmailProvider on String {
  bool get isEmailProvider {
    for (final provider in EmailProvider.values) {
      if (provider.name.toLowerCase().trim() == trim().toLowerCase()) {
        return true;
      }
    }
    return false;
  }
}

extension Append on TextEditingController {
  void append(String text) {
    this.text += text;
    selection = TextSelection.fromPosition(
      TextPosition(
        offset: this.text.length,
      ),
    );
  }
}

class DropTargetTextField extends HookWidget {
  final Stream<String> onAppendText;
  const DropTargetTextField({
    Key? key,
    required this.onAppendText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    return StreamBuilder<String>(
      stream: onAppendText,
      builder: (context, snapshot) {
        final appendedText = snapshot.data;
        if (appendedText != null && appendedText.isNotEmpty) {
          controller.append(appendedText.withAtSign);
        }
        return DragTarget<String>(
          onWillAccept: (data) => data?.isEmailProvider ?? false,
          onAccept: (text) => controller.append(
            text.withAtSign,
          ),
          builder: (context, candidateData, rejectedData) {
            return TextField(
              autofocus: true,
              autocorrect: false,
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Enter your email here...',
                suffixIcon: IconButton(
                  onPressed: controller.clear,
                  icon: const Icon(Icons.clear),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            );
          },
        );
      },
    );
  }
}

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final streamController = useStreamController<String>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Providers in Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DropTargetTextField(
              onAppendText: streamController.stream,
            ),
            Wrap(
              spacing: 10.0,
              children: EmailProvider.values.map(
                (provider) {
                  final avatar = CircleAvatar(
                    backgroundColor: provider.backgroundColor,
                    foregroundColor: provider.foregroundColor,
                    child: Text(provider.title),
                  );
                  return Draggable<String>(
                    data: provider.name,
                    feedback: avatar,
                    child: InputChip(
                      avatar: avatar,
                      label: Text(provider.name),
                      onPressed: () {
                        streamController.sink.add(provider.name);
                      },
                    ),
                  );
                },
              ).toList(),
            )
          ],
        ),
      ),
    );
  }
}
