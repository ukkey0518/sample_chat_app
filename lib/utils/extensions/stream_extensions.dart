import 'dart:async';

extension StreamEx<T> on Stream<T> {
  /// Notify changes only if the function returns true
  Stream<T> onlyNotify(
    bool Function(T? previousEvent, T currentEvent) test,
  ) async* {
    var firstEvent = true;
    T? previousEvent;
    await for (final event in this) {
      if (firstEvent || test(previousEvent, event)) {
        yield event;
      }
      firstEvent = false;
      previousEvent = event;
    }
  }
}
