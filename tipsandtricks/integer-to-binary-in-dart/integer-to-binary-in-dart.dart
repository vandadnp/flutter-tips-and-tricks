extension ToBinary on int {
  String toBinary(
    int len, {
    int separateAtLength = 4,
    String separator = ',',
  }) =>
      toRadixString(2)
          .padLeft(len, '0')
          .splitByLength(separateAtLength)
          .join(separator);
}

void testIt() {
  assert(1.toBinary(8) == '0000,0001');
  assert(2.toBinary(4) == '0010');
  assert(3.toBinary(16) == '0000,0000,0000,0011');
  assert(255.toBinary(8, separateAtLength: 8) == '11111111');
  assert(255.toBinary(8, separateAtLength: 4) == '1111,1111');
}

extension SplitByLength on String {
  Iterable<String> splitByLength(int len, {String filler = '0'}) sync* {
    final missingFromLength =
        length % len == 0 ? 0 : len - (characters.length % len);
    final expectedLength = length + missingFromLength;
    final src = padLeft(expectedLength, filler);
    final chars = src.characters;
    for (var i = 0; i < chars.length; i += len) {
      yield chars.getRange(i, i + len).toString();
    }
  }
}
