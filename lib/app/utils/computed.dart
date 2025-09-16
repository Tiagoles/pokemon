import 'package:flutter/foundation.dart';

class Computed<T> extends ValueNotifier<T> {
  final List<Listenable> _sources;
  final T Function() _compute;
  final List<VoidCallback> _listeners = [];

  Computed(this._compute, this._sources) : super(_compute()) {
    for (final source in _sources) {
      listener() => value = _compute();
      _listeners.add(listener);
      source.addListener(listener);
    }
  }

  @override
  void dispose() {
    for (var i = 0; i < _sources.length; i++) {
      _sources[i].removeListener(_listeners[i]);
    }
    _listeners.clear();
    super.dispose();
  }
}