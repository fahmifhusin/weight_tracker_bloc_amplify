part of shared_components;

class GeneralDialog {
  static final GeneralDialog _generalDialog = GeneralDialog._internal();

  GeneralDialog._internal();

  factory GeneralDialog() {
    return _generalDialog;
  }

  void showGeneralSnackbar({required String message, required bool isError}) {
    ScaffoldMessenger.of(generalKeys.ctxRoute).removeCurrentSnackBar();
    ScaffoldMessenger.of(generalKeys.ctxRoute).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          style: styleConstant.Text14Body1(
            customColor: colorConstant.naturalWhite,
          ),
        ),
        backgroundColor: isError ? Colors.red : colorConstant.primaryBlue,
      ),
    );
  }
}
