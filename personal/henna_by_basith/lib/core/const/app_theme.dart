import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:henna_by_basith/core/const/app_bar_style.dart';
import 'package:henna_by_basith/core/const/app_colors.dart';

class AppTheme {
  AppTheme._();

  static const _radius = 12.0;

  
  static TextStyle headline({
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    Color? color,
  }) => GoogleFonts.notoSerif(
    fontSize: fontSize,
    fontWeight: fontWeight,
    letterSpacing: letterSpacing,
    color: color ?? AppColors.ink,
  );

  static ThemeData get light {
    final scheme = ColorScheme.fromSeed(seedColor: AppColors.primary).copyWith(
      primary: AppColors.primary,
      onPrimary: AppColors.onAccent,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onAccent,
      tertiary: AppColors.tertiary,
      error: AppColors.error,
      surface: AppColors.card,
      onSurface: AppColors.ink,
      outline: AppColors.line,
    );

    
    final TextTheme? baseText = ThemeData(useMaterial3: true).textTheme;

    
    final body = GoogleFonts.plusJakartaSansTextTheme(baseText)
        .apply(bodyColor: AppColors.ink, displayColor: AppColors.ink);

    
    final TextTheme? textTheme = TextTheme(
      bodyLarge: GoogleFonts.notoSerif(textStyle: body.displayLarge),
      displayMedium: GoogleFonts.notoSerif(textStyle: body.displayMedium),
      displaySmall: GoogleFonts.notoSerif(textStyle: body.displaySmall),
      headlineLarge: GoogleFonts.notoSerif(textStyle: body.headlineLarge),
      headlineMedium: GoogleFonts.notoSerif(textStyle: body.headlineMedium),
      headlineSmall: GoogleFonts.notoSerif(textStyle: body.headlineSmall),
    );

   

    OutlineInputBorder border(Color color, [double width = 1.5]) =>
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(_radius),
          borderSide: BorderSide(color: color, width: width),
        );

    
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: textTheme,

      
      appBarTheme: AppBarStyle.light,

      
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(color: AppColors.muted, fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        enabledBorder: border(AppColors.line),
        focusedBorder: border(AppColors.accent, 2),
        errorBorder: border(AppColors.error),
        focusedErrorBorder: border(AppColors.error, 2),
        errorStyle: const TextStyle(color: AppColors.error, fontSize: 13),
        errorMaxLines: 2,
      ),

      // ---- Buttons ----
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: AppColors.onAccent,
          disabledBackgroundColor: AppColors.accentDisabled,
          minimumSize: const Size(64, 50),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_radius),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.ink,
          side: const BorderSide(color: AppColors.muted),
          minimumSize: const Size(64, 46),
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_radius),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.accent,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),

     
      chipTheme: const ChipThemeData(
        backgroundColor: AppColors.card,
        selectedColor: AppColors.accentSoft,
        side: BorderSide(color: AppColors.line),
        shape: StadiumBorder(),
        labelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.ink,
        ),
      ),

     
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.card,
        showDragHandle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
      ),

      
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected)
              ? AppColors.onAccent
              : AppColors.muted,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected)
              ? AppColors.accent
              : AppColors.line,
        ),
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      ),
      sliderTheme: const SliderThemeData(
        activeTrackColor: AppColors.accent,
        inactiveTrackColor: AppColors.line,
        thumbColor: AppColors.accent,
        overlayColor: AppColors.accentSoft,
        valueIndicatorColor: AppColors.accent,
      ),

      
      badgeTheme: const BadgeThemeData(
        backgroundColor: AppColors.tertiary,
        textColor: AppColors.ink,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.accent,
      ),
      dividerTheme: const DividerThemeData(color: AppColors.line, space: 1),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.ink,
        contentTextStyle: const TextStyle(color: AppColors.onAccent),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_radius),
        ),
      ),
    );
  }
}
