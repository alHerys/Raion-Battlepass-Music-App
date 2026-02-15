import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:birdle/core/constants/image_const.dart';
import 'package:birdle/bloc/auth/auth_bloc.dart';

import '../../../core/components/app_logo.dart';
import '../../../core/theme/app_pallete.dart';
import '../widget/onboarding_content.dart';
import 'auth_bottom_sheets.dart';

class AuthOnboardingPage extends StatefulWidget {
  const AuthOnboardingPage({super.key});

  @override
  State<AuthOnboardingPage> createState() => _AuthOnboardingPageState();
}

class _AuthOnboardingPageState extends State<AuthOnboardingPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppPallete.transparent,
        elevation: 0,
        leadingWidth: double.infinity,
        leading: AppLogo(),
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConst.onboardingBackground),
            fit: .fitWidth,
          ),
        ),
        child: OnboardingContent(
          getStartedButton: () => AuthBottomSheets.nameBottomSheet(
            context: context,
            emailController: emailController,
            passwordController: passwordController,
            nameController: nameController,
            confirmPasswordController: confirmPasswordController,
            loginButton: () async {
              context.read<AuthBloc>().add(
                AuthLoginEvent(
                  email: emailController.text,
                  password: passwordController.text,
                ),
              );
            },
            signUpButton: () async {
              context.read<AuthBloc>().add(
                AuthSignUpEvent(
                  name: nameController.text.trim(),
                  email: emailController.text,
                  password: passwordController.text,
                ),
              );
            },
          ),
          loginButton: () => AuthBottomSheets.loginBottomSheet(
            context: context,
            emailController: emailController,
            passwordController: passwordController,
            nameController: nameController,
            confirmPasswordController: confirmPasswordController,
            loginButton: () async {
              context.read<AuthBloc>().add(
                AuthLoginEvent(
                  email: emailController.text,
                  password: passwordController.text,
                ),
              );
            },
            signUpButton: () async {
              context.read<AuthBloc>().add(
                AuthSignUpEvent(
                  name: nameController.text.trim(),
                  email: emailController.text,
                  password: passwordController.text,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
