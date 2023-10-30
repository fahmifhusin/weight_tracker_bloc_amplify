part of shared_components;

class GeneralDialog {
  static final GeneralDialog _generalDialog = GeneralDialog._internal();

  GeneralDialog._internal();

  factory GeneralDialog() {
    return _generalDialog;
  }

  void showDialogConfirmation({
    required String titleMsg,
    required String titleBtnLeft,
    required String titleBtnRight,
    required Function btnLeftAction,
    required Function btnRightAction,
    bool isDismissible = true,
  }) {
    showDialog(
      barrierColor: colorConstant.neutralShadowDarker.withOpacity(0.5),
      barrierDismissible: isDismissible,
      context: generalKeys.ctxRoute,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              dimensionConstant.spacing10,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(
            dimensionConstant.spacing16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                titleMsg,
                style: styleConstant.Text18Heading2(),
              ),
              SizedBox(
                height: dimensionConstant.spacing18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                      child: generalButtons.PrimaryButton(
                          function: btnLeftAction, btnTitle: titleBtnLeft)),
                  SizedBox(
                    width: dimensionConstant.spacing12,
                  ),
                  Expanded(
                    child: generalButtons.PrimaryButton(
                      function: btnRightAction,
                      btnTitle: titleBtnRight,
                      customBtnColor: colorConstant.secondaryRedRose,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void showDialogEditProfile(
      {required String title,
      required String btnTitle,
      required List<String> fieldTitle,
      required Function function,
      required List<TextEditingController> tec,
      bool isDismissible = true,
      bool isLoading = false,
      bool isActive = true}) {
    showDialog(
      barrierColor: colorConstant.neutralShadowDarker.withOpacity(0.5),
      barrierDismissible: isDismissible,
      context: generalKeys.ctxRoute,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              dimensionConstant.spacing10,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: dimensionConstant.spacing20,
            horizontal: dimensionConstant.spacing16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: styleConstant.Text22Heading1(
                    customColor: colorConstant.splashYellow),
              ),
              customField.FieldText(
                title: fieldTitle[0],
                teController: tec[0],
              ),
              Row(
                children: [
                  Expanded(
                    child: customField.FieldText(
                      title: fieldTitle[1],
                      teController: tec[1],
                      inputType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    width: dimensionConstant.spacing16,
                  ),
                  Expanded(
                    child: customField.FieldText(
                      title: fieldTitle[2],
                      teController: tec[2],
                      inputType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              generalButtons.PrimaryButton(
                isActive: isActive,
                isLoading: isLoading,
                function: () => function(),
                btnTitle: btnTitle,
              ),
              generalButtons.PrimaryButton(
                customBtnColor: colorConstant.secondaryRedRose,
                isActive: isActive,
                isLoading: isLoading,
                function: () => generalKeys.ctxRoute.pop(),
                btnTitle: stringConstant.cancel,
              ),
              Container(
                height: dimensionConstant.spacing20,
                width: functionSharing.screenWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showDialogWeightManagement(
      {required String title,
      required String btnTitle,
      required Function function,
      required TextEditingController textEditingController,
      bool isDismissible = true,
      bool isLoading = false,
      bool isActive = true}) {
    showDialog(
      barrierColor: colorConstant.neutralShadowDarker.withOpacity(0.5),
      barrierDismissible: isDismissible,
      context: generalKeys.ctxRoute,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              dimensionConstant.spacing10,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: dimensionConstant.spacing20,
            horizontal: dimensionConstant.spacing16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: styleConstant.Text22Heading1(
                    customColor: colorConstant.splashYellow),
              ),
              customField.FieldText(
                title: '',
                teController: textEditingController,
                inputType: TextInputType.number,
              ),
              Row(
                children: [
                  Expanded(
                    child: generalButtons.PrimaryButton(
                      isActive: isActive,
                      isLoading: isLoading,
                      function: () => function(),
                      btnTitle: btnTitle,
                    ),
                  ),
                  SizedBox(
                    width: dimensionConstant.spacing16,
                  ),
                  Expanded(
                    child: generalButtons.PrimaryButton(
                      customBtnColor: colorConstant.secondaryRedRose,
                      isActive: isActive,
                      isLoading: isLoading,
                      function: () => generalKeys.ctxRoute.pop(),
                      btnTitle: stringConstant.cancel,
                    ),
                  ),
                ],
              ),
              Container(
                height: dimensionConstant.spacing20,
                width: functionSharing.screenWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showGeneralSnackbar(
      {Color? customColor, required String message, required bool isError}) {
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
        backgroundColor: customColor != null
            ? customColor
            : isError
                ? colorConstant.secondaryRedRose
                : colorConstant.primaryBlue,
      ),
    );
  }
}
