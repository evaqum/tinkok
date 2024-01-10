extension LetX<T> on T? {
  R? let<R>(R Function(T self) let) {
    final self = this;
    if (self == null) {
      return null;
    }

    return let(self);
  }
}

extension AlsoX<T> on T {
  T also(void Function(T self) also) {
    also(this);
    return this;
  }
}

extension RunX<T> on T {
  R run<R>(R Function(T self) run) {
    return run(this);
  }
}
