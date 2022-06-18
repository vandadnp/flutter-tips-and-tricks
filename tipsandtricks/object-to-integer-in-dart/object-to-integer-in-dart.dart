// Want to support my work 🤝? https://buymeacoffee.com/vandad

enum ToIntStrategy { round, floor, ceil }

typedef ToIntOnErrorHandler = int Function(Object e);

extension ToInt on Object {
  int toInteger({
    ToIntStrategy strategy = ToIntStrategy.round,
    ToIntOnErrorHandler? onError,
  }) {
    try {
      final doubleValue = double.parse(toString());
      switch (strategy) {
        case ToIntStrategy.round:
          return doubleValue.round();
        case ToIntStrategy.floor:
          return doubleValue.floor();
        case ToIntStrategy.ceil:
          return doubleValue.ceil();
      }
    } catch (e) {
      if (onError != null) {
        return onError(e);
      } else {
        return -1;
      }
    }
  }
}

void testIt() {
  assert('xyz'.toInteger(onError: (_) => 100) == 100);
  assert(1.5.toInteger() == 2);
  assert(1.6.toInteger() == 2);
  assert('1.2'.toInteger(strategy: ToIntStrategy.floor) == 1);
  assert('1.2'.toInteger(strategy: ToIntStrategy.ceil) == 2);
  assert('1.5'.toInteger(strategy: ToIntStrategy.round) == 2);
}
