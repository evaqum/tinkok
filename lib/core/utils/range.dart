// спиздил из quiver дауны [Iterable<num>] решили возвращать
Iterable<int> intRange(int startOrStop, [int? stop, int? step]) sync* {
  final start = stop == null ? 0 : startOrStop;
  stop ??= startOrStop;
  step ??= 1;

  if (step == 0) throw ArgumentError('step cannot be 0');
  if (step > 0 && stop < start) {
    throw ArgumentError('if step is positive, stop must be greater than start');
  }
  if (step < 0 && stop > start) {
    throw ArgumentError('if step is negative, stop must be less than start');
  }

  for (var value = start; step < 0 ? value > stop : value < stop; value += step) {
    yield value;
  }
}
