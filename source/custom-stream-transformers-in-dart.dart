/*
Want to support my work 😎? https://buymeacoffee.com/vandad

in this example we have created our own string transformer that
can trim a Stream<String> by trimming whitespace from both
beginning and end of the string
*/

import 'dart:convert' show utf8;

class StringTrimmer extends StreamTransformerBase<String, String> {
  const StringTrimmer();
  @override
  Stream<String> bind(Stream<String> stream) =>
      Stream.fromFuture(stream.join(' ')).map((str) => str.trim());
}

final string =
    '''   A long line of text with spaces in the beginning and the end, 
    divided into three lines just for the purpose of this demonstration    ''';

void testIt() async {
  final bytes = utf8.encode(string);
  final result = await Stream.value(bytes)
      .transform(utf8.decoder)
      .transform(LineSplitter())
      .transform(StringTrimmer())
      .join();
  print(result);
}
