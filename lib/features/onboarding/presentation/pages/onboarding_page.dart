import 'package:birdle/core/theme/app_pallete.dart';
import 'package:birdle/core/theme/app_text.dart';
import 'package:flutter/material.dart';
import '../../../../core/components/app_logo.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

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

      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/onboarding_bg.png'),
                fit: .cover,
                alignment: Alignment(-0.1, 0),
              ),
            ),
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppPallete.backgroundBlack,
                  AppPallete.backgroundBlack.withValues(alpha: 0.8),
                  AppPallete.backgroundBlack.withValues(alpha: 0.5),
                ],
                begin: .topCenter,
                end: .bottomCenter,
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Column(
                crossAxisAlignment: .stretch,
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    'Millions of songs Free for You',
                    style: AppText.headingLarge,
                  ),
                  Column(
                    crossAxisAlignment: .stretch,
                    spacing: 29,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.2),
                          foregroundColor: Theme.of(
                            context,
                          ).colorScheme.onSurface,
                        ),
                        child: Text('Get Started'),
                      ),
                      RichText(
                        textAlign: .center,
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: AppText.caption.copyWith(
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface,
                          ),
                          children: [
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
