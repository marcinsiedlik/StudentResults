extension MapExtension<K, V> on Map<K, V> {
  bool all(bool predicate(K key, V value)) {
    int matchCases = 0;
    this.forEach((key, value) {
      if (predicate(key, value)) matchCases++;
    });
    return matchCases == this.length;
  }

  bool any(bool predicate(K key, V value)) {
    int matchCases = 0;
    this.forEach((key, value) {
      if (predicate(key, value)) matchCases++;
    });
    return matchCases > 0;
  }
}
