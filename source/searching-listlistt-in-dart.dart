// Want to support my work 🤝? https://buymeacoffee.com/vandad

const arr1 = [1, 2, 3];
const arr2 = [4, 5, 6];
const arr3 = [7, 8, 9];
const arr = [arr1, arr2, arr3];

extension FlattenFind<T extends Comparable> on Iterable<Iterable<T>> {
  bool containsElement(T value) {
    for (final arr in this) {
      if (arr.contains(value)) {
        return true;
      }
    }
    return false;
  }
}

void testIt() {
  assert(arr.containsElement(2));
  assert(arr.containsElement(8));
  assert(!arr.containsElement(10));
  assert(!arr.containsElement(10));
}
