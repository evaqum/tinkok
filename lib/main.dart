import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'features/app/app.dart';
import 'features/app/di/configure_dependencies.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  configureDependencies();

  runApp(TinkokApp());
}
