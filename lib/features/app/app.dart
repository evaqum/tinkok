import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../security/bloc/security_bloc.dart';
import 'presentation/navigation/routes.dart';

class TinkokApp extends StatelessWidget {
  final _router = GoRouter(
    routes: $appRoutes,
    initialLocation: const SplashScreenRoute().location,
  );

  TinkokApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SecurityBloc() //
            ..add(const SecurityEvent.initialized()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _router,
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFFEDD2C),
            brightness: Brightness.dark,
            background: const Color(0xFF121212),
          ),
        ),
      ),
    );
  }
}
