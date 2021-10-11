// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'dart:io' show stdout;
import 'dart:async' show Future, Stream;

const loadingSequence = ['⢿', '⣻', '⣽', '⣾', '⣷', '⣯', '⣟', '⡿'];
const escape = '\x1B[38;5;';
const color = '${escape}1m';
const textColor = '${escape}6m';

String progress({required int value, required String text}) {
  final progress = '$color${loadingSequence[value % loadingSequence.length]}';
  final coloredText = '$textColor$text';
  return '$progress\t$coloredText';
}

Future<T> performWithProgress<T>({
  required Future<T> task,
  required String progressText,
}) {
  final stream = Stream<String>.periodic(
    Duration(milliseconds: 100),
    (value) => progress(
      value: value,
      text: progressText,
    ),
  );

  final subscription = stream.listen(
    (event) {
      stdout.write('\r $event');
    },
  );

  task.whenComplete(() {
    stdout.write('\r ✅\t$progressText');
    stdout.write('\n');
    subscription.cancel();
  });

  return task;
}

final task1 = Future.delayed(Duration(seconds: 1), () => 'Result 1');
final task2 = Future.delayed(Duration(seconds: 2), () => 'Result 2');
final task3 = Future.delayed(Duration(seconds: 3), () => 'Result 3');

void main(List<String> args) async {
  var result = await performWithProgress(
    task: task1,
    progressText: 'Loading task 1',
  );
  print('\tTask 1 result: $result');
  result = await performWithProgress(
    task: task2,
    progressText: 'Loading task 2',
  );
  print('\tTask 2 result: $result');
  result = await performWithProgress(
    task: task3,
    progressText: 'Loading task 3',
  );
  print('\tTask 3 result: $result');
}
