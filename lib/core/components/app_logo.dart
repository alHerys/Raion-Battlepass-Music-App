import 'package:birdle/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        spacing: 4,
        children: [
          Image.asset('assets/logo.png', width: 17, height: 25),
          RichText(
            text: TextSpan(
              text: 'Raion',
              style: TextStyle(fontSize: 22, fontWeight: .w700),
              children: [
                TextSpan(
                  text: 'ME',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: .w700,
                    color: AppPallete.yellow,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
