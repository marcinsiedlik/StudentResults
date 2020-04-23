extension ListExtension<T> on Iterable<T> {
  T firstWhereOrNull(bool test(T element), {T orElse()}) {
    for (T element in this) {
      if (test(element)) return element;
    }
    if (orElse != null) return orElse();
    return null;
  }

  bool all(bool Function(T) predicate) {
    if (this.isEmpty) {
      return true;
    }
    for (var element in this) {
      if (!predicate(element)) {
        return false;
      }
    }
    return true;
  }

  List<T> filter(bool Function(T) predicate) {
    final filtered = <T>[];
    for (var element in this) {
      if (predicate(element)) {
        filtered.add(element);
      }
    }
    return filtered;
  }

  Iterable<A> mapIndexed<A, B>(A Function(int index, T item) f) sync* {
    var index = 0;

    for (T item in this) {
      yield f(index, item);
      index = index + 1;
    }
  }
}
