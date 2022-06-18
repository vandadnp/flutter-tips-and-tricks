// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'dart:io' show stdout, stderr, exitCode;
import 'package:collection/collection.dart' show IterableExtension;

// example argument: https://www.youtube.com/watch?v=mtETXtSP0pA
void main(List<String> args) async {
  if (args.isEmpty) {
    stdout.writeln('usage: dart youtube.dart "https://..."');
    return;
  }

  final link =
      args.firstWhereOrNull((element) => Uri.tryParse(element) != null);

  if (link == null) {
    stderr.writeln('No YouTube url found');
    exitCode = 1;
    return;
  }

  try {
    final uri = Uri.parse(link);
    if (uri.scheme.toLowerCase() != 'https' ||
        uri.host.toLowerCase() != 'www.youtube.com' ||
        uri.queryParameters['v'] == null) {
      throw FormatException();
    } else {
      final videoId = uri.queryParameters['v'];
      final embedUri = Uri.parse('${uri.scheme}://${uri.host}/embed/$videoId');
      stdout.writeln(embedUri);
      exitCode = 0;
    }
  } on FormatException catch (e) {
    stderr.writeln('Invalid Uri, try again! err = $e');
    exitCode = 1;
    return;
  }
}
