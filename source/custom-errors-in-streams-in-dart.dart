// Want to support my work 🤝? https://buymeacoffee.com/vandad

class Either<V, E extends Exception> {
  final V? value;
  final E? error;

  const Either({this.value, this.error}) : assert((value ?? error) != null);

  bool get isError => error != null;
  bool get isValue => value != null;

  @override
  String toString() {
    if (value != null) {
      return "Value: $value";
    } else if (error != null) {
      return "Error: $error";
    } else {
      return 'Unknown state';
    }
  }
}

class DateTimeException implements Exception {
  final String reason;
  const DateTimeException({required this.reason});
}

Stream<Either<DateTime, DateTimeException>> getDateTime() async* {
  var index = 0;
  while (true) {
    if (index % 2 == 0) {
      yield Either(value: DateTime.now());
    } else {
      yield const Either(
        error: DateTimeException(reason: 'Something is wrong!'),
      );
    }
    index += 1;
  }
}

void testIt() async {
  await for (final value in getDateTime()) {
    dev.log(value.toString());
  }
}
