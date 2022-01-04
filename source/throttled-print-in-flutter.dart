// Want to support my work 🤝? https://buymeacoffee.com/vandad

Stream<String> getStream() => Stream.periodic(
      const Duration(milliseconds: 100),
      (e) => DateTime.now().toString(),
    );

void testIt() async {
  await for (final now in getStream()) {
    debugPrintThrottled(now);
  }
}
