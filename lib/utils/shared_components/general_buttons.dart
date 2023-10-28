part of shared_components;

class GeneralButtons {
  static final GeneralButtons _generalButtons = GeneralButtons._internal();

  GeneralButtons._internal();

  factory GeneralButtons() {
    return _generalButtons;
  }

  Widget _BaseGeneralButton({
    required Function function,
    required String btnTitle,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: dimensionConstant.spacing20,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: colorConstant.naturalWhite,
            backgroundColor: colorConstant.primaryBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  dimensionConstant.spacing10,
                ),
              ),
            ),
            minimumSize: Size(
              functionSharing.screenWidth,
              dimensionConstant.spacing52,
            )),
        onPressed: () => function(),
        child: Text(btnTitle),
      ),
    );
  }

  Widget PrimaryButton({
    required Function function,
    required String btnTitle,
  }) {
    return _BaseGeneralButton(function: function, btnTitle: btnTitle);
  }
}
