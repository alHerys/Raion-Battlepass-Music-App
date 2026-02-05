import 'package:flutter/material.dart';

import '../../../../core/components/app_logo.dart';
import '../../../../core/theme/app_pallete.dart';
import '../widget/onboarding_content.dart';
import 'auth_bottom_sheets.dart';

class AuthOnboardingPage extends StatefulWidget {
  const AuthOnboardingPage({super.key});

  @override
  State<AuthOnboardingPage> createState() => _AuthOnboardingPageState();
}

class _AuthOnboardingPageState extends State<AuthOnboardingPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: double.infinity,
        backgroundColor: AppPallete.transparent,
        leading: Padding(padding: EdgeInsets.only(left: 11), child: AppLogo()),
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/onboarding_bg.png'),
            fit: .cover,
          ),
        ),
        child: OnboardingContent(
          getStartedButton: () => AuthBottomSheets.nameBottomSheet(
            context: context,
            emailController: emailController,
            passwordController: passwordController,
            nameController: nameController,
            signUpButton: () {},
          ),
          loginButton: () => AuthBottomSheets.loginBottomSheet(
            context: context,
            emailController: emailController,
            passwordController: passwordController,
            nameController: nameController,
            loginButton: () {},
            signUpButton: () {},
          ),
        ),
      ),
    );
  }
}
