import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/image_const.dart';
import '../auth/page/auth_onboarding_page.dart';
import '../../viewmodel/auth/auth_bloc.dart';
import '../home/pages/root_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  if (state is AuthSuccess) {
                    return const RootPage();
                  } else {
                    return const AuthOnboardingPage();
                  }
                },
                transitionDuration: const Duration(milliseconds: 500),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
              ),
            );
          },
          child: Image.asset(
            ImageConst.splashLogo,
            filterQuality: .high,
            width: 180,
            height: 180,
          ),
        ),
      ),
    );
  }
}
