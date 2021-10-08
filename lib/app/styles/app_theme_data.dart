import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/app/styles/theme_data_radio_life.dart';

import 'app_color_scheme.dart';
import 'app_font_size.dart';
import 'app_font_weight.dart';
import 'app_spacing.dart';
import 'app_text_theme.dart';

/// https://medium.com/flutter-community/page-transitions-using-themedata-in-flutter-c24afadb0b5d
class AppThemeData extends ThemeDataApp {
  AppThemeData._();

  static bool? _appThemeModeIsDark;

  static void setIfAppThemeModeIsDark({bool? isDark}) {
    _appThemeModeIsDark = isDark;
  }

  static bool get appThemeModeIsDark =>
      _appThemeModeIsDark ?? ThemeDataApp.isDark ?? true;

  static ThemeData get themeData =>
      appThemeModeIsDark ? themeDataDark : themeDataLight;

  static ThemeMode get themeMode => ThemeDataApp.isDark == null
      ? ThemeMode.system
      : appThemeModeIsDark
          ? ThemeMode.dark
          : ThemeMode.light;

  static final ThemeData themeDataLight = ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: AppTextTheme.textTheme,
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: Colors.transparent),
    tabBarTheme: const TabBarTheme(
      labelStyle: TextStyle(
          fontSize: AppFontSize.primary,
          fontWeight: AppFontWeight.semiBold,
          fontFamily: 'Montserrat'),
      unselectedLabelStyle: TextStyle(
          fontSize: AppFontSize.primary,
          fontWeight: AppFontWeight.semiBold,
          fontFamily: 'Montserrat'),
      labelPadding: EdgeInsets.symmetric(horizontal: AppSpacing.extraSmall),
    ),
    scaffoldBackgroundColor: RadioLifeLightThemeColors.background,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: AppColorScheme.successLight,
      cursorColor: AppColorScheme.success,
      selectionHandleColor: AppColorScheme.success,
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: RadioLifeLightThemeColors.background,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
      },
    ),
    cupertinoOverrideTheme: const CupertinoThemeData(
      brightness: Brightness.light,
    ),
    iconTheme: IconThemeData(
      color: AppColorScheme.primarySwatchLight[500],
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      elevation: 0,
    ),
    buttonTheme: ButtonThemeData(
        colorScheme: AppColorScheme.colorSchemeLight,
        textTheme: ButtonTextTheme.primary),
    colorScheme: AppColorScheme.colorSchemeLight.copyWith(
        primary: AppColorScheme.primarySwatchLight,
        secondary: AppColorScheme.accentColorLight),
  );

  static final ThemeData themeDataDark = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    tabBarTheme: const TabBarTheme(
      labelStyle: TextStyle(
          fontSize: AppFontSize.primary,
          fontWeight: AppFontWeight.semiBold,
          fontFamily: 'Montserrat'),
      unselectedLabelStyle: TextStyle(
          fontSize: AppFontSize.primary,
          fontWeight: AppFontWeight.semiBold,
          fontFamily: 'Montserrat'),
      labelPadding: EdgeInsets.symmetric(horizontal: AppSpacing.extraSmall),
    ),
    textTheme: AppTextTheme.textTheme,
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: Colors.transparent),
    scaffoldBackgroundColor: RadioLifeDarkThemeColors.background,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: AppColorScheme.successLight,
      cursorColor: AppColorScheme.success,
      selectionHandleColor: AppColorScheme.success,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: RadioLifeDarkThemeColors.background,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
      },
    ),
    iconTheme: IconThemeData(
      color: AppColorScheme.primarySwatchDark[500],
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: RadioLifeDarkThemeColors.backgroundLight,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: RadioLifeDarkThemeColors.emphasis,
      unselectedItemColor: RadioLifeDarkThemeColors.emphasis.withOpacity(0.3),
      elevation: 0,
    ),
    buttonTheme: ButtonThemeData(
        colorScheme: AppColorScheme.colorSchemeDark,
        textTheme: ButtonTextTheme.primary),
    colorScheme: AppColorScheme.colorSchemeDark.copyWith(
        primary: AppColorScheme.primarySwatchDark,
        secondary: AppColorScheme.accentColorDark),
  );
}
