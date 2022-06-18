// Want to support my work 🤝? https://buymeacoffee.com/vandad

extension Minus on String {
  String operator -(String rhs) => replaceAll(rhs, '');
}

void testIt() {
  assert('foo bar' - 'foo ' == 'bar');
  assert('foo bar foo' - 'foo' == ' bar ');
  assert('bar' - 'foo' == 'bar');
  assert('BAR' - 'bar' == 'BAR');
  assert('foo' - 'FOO' == 'foo');
  assert('foobarbaz' - 'bar' == 'foobaz');
}
