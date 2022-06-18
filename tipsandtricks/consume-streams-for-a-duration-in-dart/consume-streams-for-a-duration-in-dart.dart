extension TakeFor<T> on Stream<T> {
  Stream<T> takeFor(Duration duration) {
    final upTo = DateTime.now().add(duration);
    return takeWhile((_) {
      final now = DateTime.now();
      return now.isBefore(upTo) | now.isAtSameMomentAs(upTo);
    });
  }
}

Stream<DateTime> source() => Stream.periodic(
      Duration(milliseconds: 500),
      (_) => DateTime.now(),
    );

void testIt() async {
  await for (final dateTime in source().takeFor(
    Duration(seconds: 4),
  )) {
    print('date time is $dateTime');
  }
}
