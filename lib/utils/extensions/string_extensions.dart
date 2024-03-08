extension StringEx on String {
  /// Omit strings longer than the specified length
  String ellipsis(int limit) {
    if (limit >= length) {
      return this;
    }
    return '${substring(0, limit)}...';
  }
}
