// Free Flutter Course 💙 https://linktr.ee/vandadnp
// Want to support my work 🤝? https://buymeacoffee.com/vandad

class Address with IterableMixin {
  final String line1;
  final String line2;
  final String postCode;

  Address({
    required this.line1,
    required this.line2,
    required this.postCode,
  });

  @override
  Iterator<String> get iterator => [line1, line2, postCode].iterator;
}

void testIt() {
  final address = Address(
    line1: 'Foo bar avenue, #10',
    line2: 'Baz street',
    postCode: '123456',
  );
  for (final line in address) {
    devtools.log(line);
  }
}
