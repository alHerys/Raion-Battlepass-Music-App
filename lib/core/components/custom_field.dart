import 'package:flutter/material.dart';

import '../theme/app_text.dart';

class CustomField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String? labelText;
  final bool isObscure;
  final bool readOnly;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final bool filled;

  const CustomField({
    super.key,
    required this.hintText,
    required this.validator,
    this.isObscure = false,
    this.readOnly = false,
    this.controller,
    this.labelText,
    this.onTap,
    this.filled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        if (labelText != null)
          Padding(
            padding: EdgeInsets.only(left: 10, bottom: 6),
            child: Text(
              labelText!,
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
          decoration: InputDecoration(hintText: hintText, filled: filled),
          validator: validator,
        ),
      ],
    );
  }
}
