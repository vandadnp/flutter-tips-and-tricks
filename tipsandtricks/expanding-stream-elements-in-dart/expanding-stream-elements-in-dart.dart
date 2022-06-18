/*
Want to support my work 😎? https://buymeacoffee.com/vandad

in this example we expand every element inside our Stream<int> to
a stream that in turn contains n+1 elements where n is the index generated
by our main stream, that's to say, 0, 1, 2, 3, 4, etc

*/
Stream<int> nestedEvents(int count) {
  return Stream.periodic(
    Duration(seconds: 1),
    (e) => e,
  ).take(count).asyncExpand(
        (i) => Stream.fromIterable(
          Iterable.generate(i + 1),
        ),
      );
}

void testIt() async {
  /* 
  prints the followings in this order
  0, 1
  0, 1, 2
  0, 1, 2, 3
  0, 1, 2, 3, 4
  */
  await for (final value in nestedEvents(5)) {
    print('Value is $value');
  }
}
