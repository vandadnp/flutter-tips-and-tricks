// Want to support my work 🤝? https://buymeacoffee.com/vandad

final person = {
  'firstName': 'Foo',
  'lastName': 'Bar',
  'age': 30,
  'address': {
    'street': {
      'name': 'Baz street',
      'numberOfHouses': 20,
    },
    'houseNumber': '#20',
    'city': 'Stockholm',
    'country': 'Sweden'
  },
};

extension KeyPath on Map {
  Object? valueFor({required String keyPath}) {
    final keysSplit = keyPath.split('.');
    final thisKey = keysSplit.removeAt(0);
    final thisValue = this[thisKey];
    if (keysSplit.isEmpty) {
      return thisValue;
    } else if (thisValue is Map) {
      return thisValue.valueFor(keyPath: keysSplit.join('.'));
    }
  }
}

void testIt() {
  assert(person.valueFor(keyPath: 'firstName') == 'Foo');
  assert(person.valueFor(keyPath: 'age') == 30);
  assert(person.valueFor(keyPath: 'address.street.name') == 'Baz street');
  assert(person.valueFor(keyPath: 'address.houseNumber') == '#20');
}
