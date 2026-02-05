import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:birdle/core/theme/app_text.dart';
import 'package:birdle/features/auth/presentation/widget/auth_button.dart';

class OnboardingContent extends StatelessWidget {
  final VoidCallback getStartedButton;
  final VoidCallback loginButton;

  const OnboardingContent({
    super.key,
    required this.getStartedButton,
    required this.loginButton,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          crossAxisAlignment: .stretch,
          mainAxisAlignment: .spaceBetween,
          children: [
            Text('Millions of songs Free for You', style: AppText.headingLarge),

            AuthButton(
              onTap: getStartedButton,
              buttonText: 'Get Started',
              buttonTextColor: Theme.of(context).colorScheme.onSurface,
              buttonBgColor: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.2),
              richText: RichText(
                textAlign: .center,
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: AppText.caption.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  children: [
                    TextSpan(
                      text: 'Login',
                      recognizer: TapGestureRecognizer()..onTap = loginButton,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
