part of constants;

class ColorConstant {
  static final ColorConstant _colorConstant = ColorConstant._internal();

  ColorConstant._internal();

  factory ColorConstant() {
    return _colorConstant;
  }

  ///primary color pallete
  final Color splashYellow = Color(0xFFFFB416);
  final Color naturalWhite = Color(0XFFFFFFFF);
  final Color primaryBlue = Color(0XFF2BB6F6);
  final Color neutralShadow = Color(0XFFE0E0E0);
  final Color neutralShadowDarker = Color(0XFFDADADA);
  final Color secondaryRedRose = Color(0XFFD50000);
  ///secondary color pallete

  ///other color pallete

}
