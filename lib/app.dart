import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinkok/features/home/presentation/cubit/home_screen_cubit.dart';
import 'package:tinkok/features/home/presentation/home_screen.dart';

class TinkokApp extends StatelessWidget {
  const TinkokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => HomeScreenCubit(),
        child: const HomeScreen(),
      ),
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFEDD2C),
          brightness: Brightness.dark,
        ),
      ),
    );
  }
}
