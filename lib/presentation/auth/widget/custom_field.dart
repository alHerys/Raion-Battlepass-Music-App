import 'package:flutter/material.dart';

import 'package:birdle/core/theme/app_text.dart';

class CustomField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool isObscure;
  final String? Function(String?)? validator;

  const CustomField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.validator,
    this.isObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, bottom: 6),
          child: Text(
            labelText,
            textAlign: .start,
            style: AppText.caption.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ),
        TextFormField(
          key: key,
          controller: controller,
          obscureText: isObscure,
          decoration: InputDecoration(hintText: hintText),
          validator: validator,
        ),
      ],
    );
  }
}
