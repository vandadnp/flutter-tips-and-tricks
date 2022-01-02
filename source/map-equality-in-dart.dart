// Want to support my work 🤝? https://buymeacoffee.com/vandad

typedef Name = String;
typedef Age = int;

const Map<Name, Age> people1 = {
  'foo': 20,
  'bar': 30,
  'baz': 40,
};

const Map<Name, Age> people2 = {
  'baz': 40,
  'foo': 20,
  'bar': 30,
};

void testIt() {
  assert(mapEquals(people1, people2));
}
