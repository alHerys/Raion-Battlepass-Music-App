import 'package:flutter/material.dart';

import '../theme/app_pallete.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 21, right: 10),
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
