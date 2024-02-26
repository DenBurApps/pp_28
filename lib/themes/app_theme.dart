import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultThemeGetter {
  static ThemeData get() {
    const primary = Color(0xFF000000);
    const onPrimary = Color(0xFFFFFFFF);
    const surface = Color(0xFFFFFFFF);
    const onSurface = Color(0xFF000000);
    const background = Color(0xFFffffff);
    const onBackground = Color(0xFF000000);

    return ThemeData(
      backgroundColor: background,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.unbounded(
          fontWeight: FontWeight.w400,
          fontSize: 25.0,
        ),
        displayMedium: GoogleFonts.unbounded(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        displaySmall: GoogleFonts.unbounded(
          fontWeight: FontWeight.w400,
          fontSize: 12.0,
        ),
        bodyLarge: GoogleFonts.unbounded(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        bodyMedium: GoogleFonts.unbounded(
          fontWeight: FontWeight.w500,
          fontSize: 12.0,
        ),
        bodySmall: GoogleFonts.unbounded(
          fontWeight: FontWeight.w400,
          fontSize: 10.0,
        ),
        labelLarge: GoogleFonts.unbounded(
          fontWeight: FontWeight.w500,
          fontSize: 14.0,
        ),
        labelMedium: GoogleFonts.unbounded(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        labelSmall: GoogleFonts.unbounded(
          fontWeight: FontWeight.w400,
          fontSize: 10.0,
        ),
      ).apply(
        bodyColor: onBackground,
        displayColor: onBackground,
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
            const Size(double.infinity, 56),
          ),
          foregroundColor: MaterialStateProperty.all(primary),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
            const Size(
              double.infinity,
              56.0,
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
                (states) {
              if (states.contains(MaterialState.disabled)) {
                return primary.withOpacity(0.3);
              }
              return primary;
            },
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
              const Size(
                double.infinity,
                53.0,
              ),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            side: MaterialStateProperty.all(
              const BorderSide(color: primary),
            )),
      ),
      colorScheme: const ColorScheme(
        primary: primary,
        secondary: Colors.white,
        surface: surface,
        onSurface: onSurface,
        background: background,
        secondaryContainer: Colors.white,
        onBackground: onBackground,
        error: Colors.white,
        onError: Colors.white,
        brightness: Brightness.light,
        onPrimary: onPrimary,
        onSecondary: Colors.white,
      ),
    );
  }
}