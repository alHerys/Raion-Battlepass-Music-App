import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_pallete.dart';
import 'app_text.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static final darkTheme = ThemeData(
    fontFamily: GoogleFonts.inter().fontFamily,
    brightness: .dark,
    
    colorScheme: ColorScheme.dark(
      
      primary: AppPallete.yellow,
      onPrimary: AppPallete.textBlack,
      surface: AppPallete.backgroundBlack,
      onSurface: AppPallete.white,
      onSurfaceVariant: AppPallete.textGray,
      primaryContainer: AppPallete.containerBlack,
      onPrimaryContainer: AppPallete.white,
      onSecondaryContainer: AppPallete.iconBackgroud,
      secondary: AppPallete.gray,
      onSecondary: AppPallete.textBlack,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppPallete.yellow,
        foregroundColor: AppPallete.textBlack,
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        padding: .symmetric(vertical: 16, horizontal: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      border: _border(),
      enabledBorder: _border(),
      focusedBorder: _border(),
      errorBorder: _border().copyWith(
        borderSide: BorderSide(color: AppPallete.red, width: 0),
      ),
      hintStyle: AppText.caption,
      contentPadding: EdgeInsets.symmetric(horizontal: 15),
      filled: true,
      fillColor: AppPallete.white.withValues(alpha: 0.2),
    ),

    bottomSheetTheme: BottomSheetThemeData(
      showDragHandle: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: .circular(27)),
      ),
      backgroundColor: AppPallete.containerBlack,
    ),

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppPallete.yellow,
      circularTrackColor: AppPallete.white.withValues(alpha: 0.2),
      borderRadius: .all(.circular(50)),
    ),
  );

  static OutlineInputBorder _border() => OutlineInputBorder(
    borderRadius: BorderRadius.circular(70),
    borderSide: BorderSide(color: AppPallete.transparent),
  );
}
