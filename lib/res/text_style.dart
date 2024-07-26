import 'package:flutter/material.dart';
import 'package:pingolearn/res/AppColors.dart';

class TextSwatch<T> {
  const TextSwatch(this._swatch);

  @protected
  final Map<T, TextStyle> _swatch;

  TextStyle? operator [](T index) => _swatch[index];
}

class TextStyleWeights extends TextSwatch {
  TextStyleWeights(super.swatch);

  TextStyle get w100 => this[100]!;

  TextStyle get w200 => this[200]!;

  TextStyle get w300 => this[300]!;

  TextStyle get w400 => this[400]!;

  TextStyle get w500 => this[500]!;

  TextStyle get w600 => this[600]!;

  TextStyle get w700 => this[700]!;

  TextStyle get w800 => this[800]!;

  TextStyle get w900 => this[900]!;
}

class AppTextStyles extends TextStyleWeights {
  static String kFontFamily = 'Poppins';
  static Color textColor = AppColors.black;

  AppTextStyles(super.swatch);

  static TextStyle _style10 = TextStyle(fontSize: 10.0, fontFamily: kFontFamily, color: textColor);
  static AppTextStyles style10px = AppTextStyles(<int, TextStyle>{
    100: _style10.copyWith(fontWeight: FontWeight.w100),
    200: _style10.copyWith(fontWeight: FontWeight.w200),
    300: _style10.copyWith(fontWeight: FontWeight.w300),
    400: _style10.copyWith(fontWeight: FontWeight.w400),
    500: _style10.copyWith(fontWeight: FontWeight.w500),
    600: _style10.copyWith(fontWeight: FontWeight.w600),
    700: _style10.copyWith(fontWeight: FontWeight.w700),
    800: _style10.copyWith(fontWeight: FontWeight.w800),
    900: _style10.copyWith(fontWeight: FontWeight.w900),
  });

  static TextStyle _style12 = TextStyle(fontSize: 12.0, fontFamily: kFontFamily, color: textColor);
  static AppTextStyles style12px = AppTextStyles(<int, TextStyle>{
    100: _style12.copyWith(fontWeight: FontWeight.w100),
    200: _style12.copyWith(fontWeight: FontWeight.w200),
    300: _style12.copyWith(fontWeight: FontWeight.w300),
    400: _style12.copyWith(fontWeight: FontWeight.w400),
    500: _style12.copyWith(fontWeight: FontWeight.w500),
    600: _style12.copyWith(fontWeight: FontWeight.w600),
    700: _style12.copyWith(fontWeight: FontWeight.w700),
    800: _style12.copyWith(fontWeight: FontWeight.w800),
    900: _style12.copyWith(fontWeight: FontWeight.w900),
  });

  static TextStyle _style14 = TextStyle(fontSize: 14.0, fontFamily: kFontFamily, color: textColor);
  static AppTextStyles style14px = AppTextStyles(<int, TextStyle>{
    100: _style14.copyWith(fontWeight: FontWeight.w100),
    200: _style14.copyWith(fontWeight: FontWeight.w200),
    300: _style14.copyWith(fontWeight: FontWeight.w300),
    400: _style14.copyWith(fontWeight: FontWeight.w400),
    500: _style14.copyWith(fontWeight: FontWeight.w500),
    600: _style14.copyWith(fontWeight: FontWeight.w600),
    700: _style14.copyWith(fontWeight: FontWeight.w700),
    800: _style14.copyWith(fontWeight: FontWeight.w800),
    900: _style14.copyWith(fontWeight: FontWeight.w900),
  });

  static TextStyle _style16 = TextStyle(fontSize: 16.0, fontFamily: kFontFamily, color: textColor);
  static AppTextStyles style16px = AppTextStyles(<int, TextStyle>{
    100: _style16.copyWith(fontWeight: FontWeight.w100),
    200: _style16.copyWith(fontWeight: FontWeight.w200),
    300: _style16.copyWith(fontWeight: FontWeight.w300),
    400: _style16.copyWith(fontWeight: FontWeight.w400),
    500: _style16.copyWith(fontWeight: FontWeight.w500),
    600: _style16.copyWith(fontWeight: FontWeight.w600),
    700: _style16.copyWith(fontWeight: FontWeight.w700),
    800: _style16.copyWith(fontWeight: FontWeight.w800),
    900: _style16.copyWith(fontWeight: FontWeight.w900),
  });

  static TextStyle _style18 = TextStyle(fontSize: 18.0, fontFamily: kFontFamily, color: textColor);
  static AppTextStyles style18px = AppTextStyles(<int, TextStyle>{
    100: _style18.copyWith(fontWeight: FontWeight.w100),
    200: _style18.copyWith(fontWeight: FontWeight.w200),
    300: _style18.copyWith(fontWeight: FontWeight.w300),
    400: _style18.copyWith(fontWeight: FontWeight.w400),
    500: _style18.copyWith(fontWeight: FontWeight.w500),
    600: _style18.copyWith(fontWeight: FontWeight.w600),
    700: _style18.copyWith(fontWeight: FontWeight.w700),
    800: _style18.copyWith(fontWeight: FontWeight.w800),
    900: _style18.copyWith(fontWeight: FontWeight.w900),
  });

  static TextStyle _style19 = TextStyle(fontSize: 19.0, fontFamily: kFontFamily, color: textColor);
  static AppTextStyles style19px = AppTextStyles(<int, TextStyle>{
    100: _style19.copyWith(fontWeight: FontWeight.w100),
    200: _style19.copyWith(fontWeight: FontWeight.w200),
    300: _style19.copyWith(fontWeight: FontWeight.w300),
    400: _style19.copyWith(fontWeight: FontWeight.w400),
    500: _style19.copyWith(fontWeight: FontWeight.w500),
    600: _style19.copyWith(fontWeight: FontWeight.w600),
    700: _style19.copyWith(fontWeight: FontWeight.w700),
    800: _style19.copyWith(fontWeight: FontWeight.w800),
    900: _style19.copyWith(fontWeight: FontWeight.w900),
  });

  static TextStyle _style20 = TextStyle(fontSize: 20.0, fontFamily: kFontFamily, color: textColor);
  static AppTextStyles style20px = AppTextStyles(<int, TextStyle>{
    100: _style20.copyWith(fontWeight: FontWeight.w100),
    200: _style20.copyWith(fontWeight: FontWeight.w200),
    300: _style20.copyWith(fontWeight: FontWeight.w300),
    400: _style20.copyWith(fontWeight: FontWeight.w400),
    500: _style20.copyWith(fontWeight: FontWeight.w500),
    600: _style20.copyWith(fontWeight: FontWeight.w600),
    700: _style20.copyWith(fontWeight: FontWeight.w700),
    800: _style20.copyWith(fontWeight: FontWeight.w800),
    900: _style20.copyWith(fontWeight: FontWeight.w900),
  });

  static TextStyle _style21 = TextStyle(fontSize: 21.0, fontFamily: kFontFamily, color: textColor);
  static AppTextStyles style21px = AppTextStyles(<int, TextStyle>{
    100: _style21.copyWith(fontWeight: FontWeight.w100),
    200: _style21.copyWith(fontWeight: FontWeight.w200),
    300: _style21.copyWith(fontWeight: FontWeight.w300),
    400: _style21.copyWith(fontWeight: FontWeight.w400),
    500: _style21.copyWith(fontWeight: FontWeight.w500),
    600: _style21.copyWith(fontWeight: FontWeight.w600),
    700: _style21.copyWith(fontWeight: FontWeight.w700),
    800: _style21.copyWith(fontWeight: FontWeight.w800),
    900: _style21.copyWith(fontWeight: FontWeight.w900),
  });

  static TextStyle _style22 = TextStyle(fontSize: 22.0, fontFamily: kFontFamily, color: textColor);
  static AppTextStyles style22px = AppTextStyles(<int, TextStyle>{
    100: _style22.copyWith(fontWeight: FontWeight.w100),
    200: _style22.copyWith(fontWeight: FontWeight.w200),
    300: _style22.copyWith(fontWeight: FontWeight.w300),
    400: _style22.copyWith(fontWeight: FontWeight.w400),
    500: _style22.copyWith(fontWeight: FontWeight.w500),
    600: _style22.copyWith(fontWeight: FontWeight.w600),
    700: _style22.copyWith(fontWeight: FontWeight.w700),
    800: _style22.copyWith(fontWeight: FontWeight.w800),
    900: _style22.copyWith(fontWeight: FontWeight.w900),
  });

  static TextStyle _style24 = TextStyle(fontSize: 24.0, fontFamily: kFontFamily, color: textColor);
  static AppTextStyles style24px = AppTextStyles(<int, TextStyle>{
    100: _style24.copyWith(fontWeight: FontWeight.w100),
    200: _style24.copyWith(fontWeight: FontWeight.w200),
    300: _style24.copyWith(fontWeight: FontWeight.w300),
    400: _style24.copyWith(fontWeight: FontWeight.w400),
    500: _style24.copyWith(fontWeight: FontWeight.w500),
    600: _style24.copyWith(fontWeight: FontWeight.w600),
    700: _style24.copyWith(fontWeight: FontWeight.w700),
    800: _style24.copyWith(fontWeight: FontWeight.w800),
    900: _style24.copyWith(fontWeight: FontWeight.w900),
  });

  static TextStyle _style26 = TextStyle(fontSize: 26.0, fontFamily: kFontFamily, color: textColor);
  static AppTextStyles style26px = AppTextStyles(<int, TextStyle>{
    100: _style26.copyWith(fontWeight: FontWeight.w100),
    200: _style26.copyWith(fontWeight: FontWeight.w200),
    300: _style26.copyWith(fontWeight: FontWeight.w300),
    400: _style26.copyWith(fontWeight: FontWeight.w400),
    500: _style26.copyWith(fontWeight: FontWeight.w500),
    600: _style26.copyWith(fontWeight: FontWeight.w600),
    700: _style26.copyWith(fontWeight: FontWeight.w700),
    800: _style26.copyWith(fontWeight: FontWeight.w800),
    900: _style26.copyWith(fontWeight: FontWeight.w900),
  });

  static TextStyle _style28 = TextStyle(fontSize: 28.0, fontFamily: kFontFamily, color: textColor);
  static AppTextStyles style28px = AppTextStyles(<int, TextStyle>{
    100: _style28.copyWith(fontWeight: FontWeight.w100),
    200: _style28.copyWith(fontWeight: FontWeight.w200),
    300: _style28.copyWith(fontWeight: FontWeight.w300),
    400: _style28.copyWith(fontWeight: FontWeight.w400),
    500: _style28.copyWith(fontWeight: FontWeight.w500),
    600: _style28.copyWith(fontWeight: FontWeight.w600),
    700: _style28.copyWith(fontWeight: FontWeight.w700),
    800: _style28.copyWith(fontWeight: FontWeight.w800),
    900: _style28.copyWith(fontWeight: FontWeight.w900),
  });

  static TextStyle _style30 = TextStyle(fontSize: 30.0, fontFamily: kFontFamily, color: textColor);
  static AppTextStyles style30px = AppTextStyles(<int, TextStyle>{
    100: _style30.copyWith(fontWeight: FontWeight.w100),
    200: _style30.copyWith(fontWeight: FontWeight.w200),
    300: _style30.copyWith(fontWeight: FontWeight.w300),
    400: _style30.copyWith(fontWeight: FontWeight.w400),
    500: _style30.copyWith(fontWeight: FontWeight.w500),
    600: _style30.copyWith(fontWeight: FontWeight.w600),
    700: _style30.copyWith(fontWeight: FontWeight.w700),
    800: _style30.copyWith(fontWeight: FontWeight.w800),
    900: _style30.copyWith(fontWeight: FontWeight.w900),
  });

  static TextStyle _style32 = TextStyle(fontSize: 32.0, fontFamily: kFontFamily, color: textColor);
  static AppTextStyles style32px = AppTextStyles(<int, TextStyle>{
    100: _style32.copyWith(fontWeight: FontWeight.w100),
    200: _style32.copyWith(fontWeight: FontWeight.w200),
    300: _style32.copyWith(fontWeight: FontWeight.w300),
    400: _style32.copyWith(fontWeight: FontWeight.w400),
    500: _style32.copyWith(fontWeight: FontWeight.w500),
    600: _style32.copyWith(fontWeight: FontWeight.w600),
    700: _style32.copyWith(fontWeight: FontWeight.w700),
    800: _style32.copyWith(fontWeight: FontWeight.w800),
    900: _style32.copyWith(fontWeight: FontWeight.w900),
  });
}
