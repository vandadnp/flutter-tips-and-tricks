import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

typedef BoolCallback = bool Function();

bool applyBoolFunctions(
  BoolCallback? function1,
  BoolCallback? function2,
  BoolCallback? function3,
) =>
    (function1 ?? function2 ?? function3)?.call() ?? false;

void testIt() {
  applyBoolFunctions(null, null, () => true).log(); // true
  applyBoolFunctions(null, null, null).log(); // false
}
