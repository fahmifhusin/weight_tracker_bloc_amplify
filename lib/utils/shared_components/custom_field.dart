part of shared_components;

class CustomField {
  static final CustomField _customField = CustomField._internal();

  CustomField._internal();

  factory CustomField() {
    return _customField;
  }

  Widget _BaseCustomField(
      {bool isHidePassword = false, required String title}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: dimensionConstant.spacing10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: styleConstant.Text14Body1(
              isSemiBold: true,
            ),
          ),
          SizedBox(
            height: dimensionConstant.spacing8,
          ),
          SizedBox(
            height: dimensionConstant.spacing52,
            child: TextField(
              maxLines: 1,
              obscureText: isHidePassword,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 2, color: colorConstant.splashYellow),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      dimensionConstant.spacing10,
                    ),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: colorConstant.splashYellow),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      dimensionConstant.spacing10,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget FieldText({required String title}) {
    return _BaseCustomField(title: title);
  }

  Widget FieldPassword({required String title}) {
    return _BaseCustomField(
      title: title,
      isHidePassword: true,
    );
  }
}
