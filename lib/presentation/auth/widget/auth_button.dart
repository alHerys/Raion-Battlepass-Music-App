import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;
  final Color buttonTextColor;
  final Color buttonBgColor;
  final RichText richText;

  const AuthButton({
    super.key,
    required this.onTap,
    required this.buttonText,
    required this.buttonTextColor,
    required this.buttonBgColor,
    required this.richText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      spacing: 20,
      children: [
        ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonBgColor,
            foregroundColor: buttonTextColor,
          ),
          child: Text(buttonText),
        ),
        richText,
      ],
    );
  }
}
