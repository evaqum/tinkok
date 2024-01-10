import 'dart:math';

import 'package:injectable/injectable.dart';

@module
abstract class DependenciesModule {
  @injectable
  Random get random {
    try {
      return Random.secure();
    } catch (e) {
      return Random();
    }
  }
}
