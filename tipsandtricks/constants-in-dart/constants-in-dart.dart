
// Want to support my work 🤝? https://buymeacoffee.com/vandad

class Person {
  final String name;
  final int age;
  const Person({required this.name, required this.age});
}

const foo = Person(name: 'Foo', age: 20);
const foo2 = Person(name: 'Foo', age: 20);
const bar = Person(name: 'Bar', age: 20);

void assert_eq(Object lhs, Object rhs) {
  assert(lhs == rhs);
}

void assert_ne(Object lhs, Object rhs) {
  assert(lhs != rhs);
}

void testIt() {
  assert_eq(foo, foo2);
  assert_ne(foo, bar);
  assert_ne(foo2, bar);
}
