// Want to support my work 😎? https://buymeacoffee.com/vandad

extension Unwrap<T> on List<T?>? {
  List<T> unwrap() => (this ?? []).whereType<T>().toList();
}

void testOptionalListOfOptionals() {
  final List<int?>? optionalListOfOptionals = [1, 2, null, 3, null];
  final unwrapped = optionalListOfOptionals.unwrap(); // List<int>
  print(unwrapped); // prints [1, 2, 3]
}

void testListOfOptionals() {
  final listOfOptionals = [20, 30, null, 40]; // List<int?>
  final unwrapped = listOfOptionals.unwrap(); // List<int>
  print(unwrapped); // prints [20, 30, 40]
}

void testNormalList() {
  final list = [50, 60, 70]; // List<int>
  final unwrapped = list.unwrap(); // List<int>
  print(unwrapped); // prints [50, 60, 70]
}
