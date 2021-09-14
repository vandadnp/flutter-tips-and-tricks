// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'dart:io' show Platform, exit, File, stdout, FileSystemEntityType;

const key = 'FLUTTER_ROOT';
const validTypes = [FileSystemEntityType.file, FileSystemEntityType.link];

Future<bool> isFlutterInstalled() async {
  final root = Platform.environment[key];
  if (root == null) {
    return Future.value(false);
  }
  final bin = '$root/bin/flutter';

  return File(bin)
      .stat()
      .then((value) => value.type)
      .then((type) => validTypes.contains(type));
}

void main(List<String> args) async {
  final isOrIsNot = await isFlutterInstalled() ? 'is' : 'is not';
  stdout.writeln('Flutter $isOrIsNot installed on this machine');
  exit(0);
}
