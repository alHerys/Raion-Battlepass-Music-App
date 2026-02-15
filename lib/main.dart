import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:birdle/core/theme/app_theme.dart';
import 'package:birdle/data/services/auth_service.dart';
import 'package:birdle/bloc/auth/auth_bloc.dart';
import 'package:birdle/presentation/auth/page/auth_onboarding_page.dart';
import 'package:birdle/presentation/home/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthService(),
      child: BlocProvider(
        create: (context) => AuthBloc(context.read<AuthService>()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          initialRoute: '/',
          routes: {
            '/': (_) => AuthOnboardingPage(),
            'home/': (_) => HomePage(),
          },
        ),
      ),
    );
  }
}
