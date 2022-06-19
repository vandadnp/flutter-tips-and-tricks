// Free Flutter Course 💙 https://linktr.ee/vandadnp

import 'dart:developer' as devtools show log;

extension ContainsDuplicateValues on Map {
  bool get containsDuplicateValues => 
    {...values}.length != values.length;
}

extension Log on Object {
  void log() => devtools.log(toString());
}

const people1 = {
  1: 'Foo',
  2: 'Bar',
};
const people2 = {
  1: 'Foo',
  2: 'Foo',
};

void testIt() {
  people1.containsDuplicateValues.log(); // false
  people2.containsDuplicateValues.log(); // true
}
