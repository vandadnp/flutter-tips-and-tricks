import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

const allNames = ['foo', 'bar', 'baz', 'qux'];

const disallowedNames = ['foo', 'qux'];

extension RemoveAll<E> on Iterable<E> {
  Iterable<E> operator -(Iterable<E> other) => where(
        (e) => !other.contains(e),
      );
}

void testIt() {
  final result = allNames - disallowedNames;
  result.log(); // bar, baz
}
