// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'dart:developer' as dev show log;

Future<Iterable<T>> waitOn<T>(
  Iterable<Future<T>> futures,
  Function onError,
) async {
  List<T> result = [];
  for (final future in futures) {
    final value = await future.catchError(onError);
    result.add(value);
  }
  return result;
}

void testIt() async {
  final f1 = Future.error('First Error');
  final f2 = Future.delayed(const Duration(seconds: 2), () => 10);
  final f3 = Future.error('Second error');
  final f4 = Future.delayed(const Duration(seconds: 2), () => 'Hello world');
  final result = await waitOn([f1, f2, f3, f4], (error) => -1);
  dev.log(result.toString()); // [-1, 10, -1, Hello world]
}
