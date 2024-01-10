import 'package:bloc_hooks/bloc_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../security/bloc/security_bloc.dart';
import '../navigation/routes.dart';
import 'bloc/splash_screen_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashScreenBloc(),
        ),
      ],
      child: _SplashScreen(),
    );
  }
}

class _SplashScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useBlocListener(
      (SecurityBloc _, SecurityState state) {
        state.map(
          initial: (_) {},
          unlocked: (_) => const HomeScreenRoute().go(context),
          locked: (_) => const LockScreenRoute().go(context),
        );
      },
    );

    return Scaffold(
      body: Center(
        child: Text(
          'tinkok)',
          style: GoogleFonts.inter(),
        ),
      ),
    );
  }
}
