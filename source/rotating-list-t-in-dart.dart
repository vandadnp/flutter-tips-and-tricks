// Want to support my work 🤝? https://buymeacoffee.com/vandad

extension Rotate<T> on List<T> {
  int _rotationTimes(int places) {
    if (isEmpty) {
      return 0;
    }
    if (places == 0) {
      throw ArgumentError('places should be more than 0');
    }
    return places % length;
  }

  List<T> rotatedRight(int places) {
    final times = _rotationTimes(places);
    if (times == 0) {
      return this;
    } else {
      final cutOff = length - times;
      return sublist(cutOff)..addAll(sublist(0, cutOff));
    }
  }

  List<T> rotatedLeft(int places) {
    final times = _rotationTimes(places);
    if (times == 0) {
      return this;
    } else {
      return sublist(times)..addAll(sublist(0, times));
    }
  }
}

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

const arr = [1, 2, 3];

void testIt() {
  assert(arr.rotatedRight(1).isEqualTo([3, 1, 2]));
  assert(arr.rotatedRight(2).isEqualTo([2, 3, 1]));
  assert(arr.rotatedRight(3).isEqualTo([1, 2, 3]));
  assert(arr.rotatedRight(4).isEqualTo([3, 1, 2]));
  assert(arr.rotatedLeft(1).isEqualTo([2, 3, 1]));
  assert(arr.rotatedLeft(2).isEqualTo([3, 1, 2]));
  assert(arr.rotatedLeft(3).isEqualTo([1, 2, 3]));
  assert(arr.rotatedLeft(4).isEqualTo([2, 3, 1]));
}
