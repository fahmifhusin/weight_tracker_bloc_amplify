part of constants;

class StyleConstant {
  static final StyleConstant _styleConstant = StyleConstant._internal();

  StyleConstant._internal();

  factory StyleConstant() {
    return _styleConstant;
  }

  TextStyle Text40Heading1({
    Color customColor = Colors.black,
  }) {
    return TextStyle(
      fontWeight: fontwBold,
      color: customColor,
      fontSize: dimensionConstant.spacing40,
    );
  }

  TextStyle Text20Heading1({
    Color customColor = Colors.black,
    double? customHeight,
  }) {
    return TextStyle(
      fontWeight: fontwBold,
      color: customColor,
      fontSize: dimensionConstant.spacing20,
      height: customHeight,
    );
  }

  TextStyle Text18Heading2({Color customColor = Colors.black}) {
    return TextStyle(
      fontWeight: fontwBold,
      color: customColor,
      fontSize: dimensionConstant.spacing18,
    );
  }

  TextStyle Text16Heading3({Color customColor = Colors.black}) {
    return TextStyle(
      fontWeight: fontwSemiBold,
      color: customColor,
      fontSize: dimensionConstant.spacing16,
    );
  }

  TextStyle Text14Body1({
    Color customColor = Colors.black,
    bool isSemiBold = true,
  }) {
    return TextStyle(
      fontWeight: fontwRegular,
      color: customColor,
      fontSize: dimensionConstant.spacing14,
    );
  }

  TextStyle Text12SmallText({Color customColor = Colors.black}) {
    return TextStyle(
      fontWeight: fontwRegular,
      color: customColor,
      fontSize: dimensionConstant.spacing12,
    );
  }

  Widget GeneralAppPage(
      {required Widget body,
      bool isDisableScroll = false,
      bool isEnableBack = true,
      Function? customFunctionBack,
      Color? pageColor}) {
    return WillPopScope(
      onWillPop: () async {
        if (customFunctionBack != null) {
          customFunctionBack;
        }
        return isEnableBack;
      },
      child: SafeArea(
          child: Scaffold(
        backgroundColor: pageColor,
        body: isDisableScroll ? body : SingleChildScrollView(child: body),
      )),
    );
  }
}
