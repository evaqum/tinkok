import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'configure_dependencies.config.dart';

final get = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  get.init();
}
