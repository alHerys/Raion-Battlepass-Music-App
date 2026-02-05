// import 'package:flutter/material.dart';

// class AppTheme {
//   static OutlineInputBorder _border(Color color) => OutlineInputBorder(
//     borderRadius: BorderRadius.circular(10),
//     borderSide: BorderSide(color: color, width: 3),
//   );

//   static final darkThemeMode = ThemeData.dark().copyWith(
//     scaffoldBackgroundColor: Pallete.backgroundColor,
//     inputDecorationTheme: InputDecorationTheme(
//       contentPadding: EdgeInsets.all(27),
//       enabledBorder: _border(Pallete.borderColor),
//       focusedBorder: _border(Pallete.gradient2),
//     ),
//   );
// }

import 'package:birdle/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.inter().fontFamily,
    colorScheme: ColorScheme.dark(
      primary: AppPallete.yellow,
      onPrimary: AppPallete.textBlack,
      surface: AppPallete.backgroundBlack,
      onSurface: AppPallete.white,
      onSurfaceVariant: AppPallete.textGray,
      primaryContainer: AppPallete.containerBlack,
      onPrimaryContainer: AppPallete.white,
      onSecondaryContainer: AppPallete.textGray,
      secondary: AppPallete.gray,
      onSecondary: AppPallete.textBlack,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppPallete.yellow,
        foregroundColor: AppPallete.textBlack,
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
      ),
    ),
  );
}
