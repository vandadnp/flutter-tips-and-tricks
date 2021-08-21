// Want to support my work 🤝? https://buymeacoffee.com/vandad

extension Equality<T extends Comparable> on List<T> {
  bool isEqualTo(List<T> other) {
    if (other.length != length) {
      return false;
    }
    for (var i = 0; i < length; i++) {
      if (other[i] != this[i]) {
        return false;
      }
    }
    return true;
  }
}

int ascendingComparator<T extends Comparable>(T lhs, T rhs) =>
    lhs.compareTo(rhs);
int descendingComparator<T extends Comparable>(T lhs, T rhs) =>
    rhs.compareTo(lhs);

extension Sorted<T extends Comparable> on List<T> {
  List<T> sorted({bool descending = false}) => descending
      ? ([...this]..sort(descendingComparator))
      : ([...this]..sort(ascendingComparator));
}

void testIt() {
  assert([1, 2, 3].isEqualTo([1, 2, 3]));
  assert(![1, 2, 3].isEqualTo([1, 2, 2]));
  assert([3, 1, 2].sorted().isEqualTo([1, 2, 3]));
  assert(![3, 1, 2].sorted().isEqualTo([3, 1, 2]));
  assert(['Foo', 'Bar', 'Baz'].isEqualTo(['Foo', 'Bar', 'Baz']));
  assert(!['Foo', 'Bar', 'Baz'].isEqualTo(['foo', 'Bar', 'Baz']));
}
