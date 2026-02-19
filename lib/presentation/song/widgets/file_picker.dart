import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class FilePickerWidget extends StatelessWidget {
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const FilePickerWidget({
    super.key,
    required this.icon,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: .opaque,
      child: DottedBorder(
        childOnTop: true,
        options: RoundedRectDottedBorderOptions(
          dashPattern: [8, 8],
          radius: Radius.circular(10),
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
        child: SizedBox(
          width: .infinity,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 10,
              children: [
                Icon(icon, size: 30),
                Text(textAlign: TextAlign.center, description),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
