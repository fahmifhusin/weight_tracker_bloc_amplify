part of sign_up_lib;

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpInitial());

  TextEditingController tecName = TextEditingController();
  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecPhoneNumber = TextEditingController();
  TextEditingController tecPassword = TextEditingController();
  TextEditingController tecPasswordConfirm = TextEditingController();
  TextEditingController tecCurrentWeight = TextEditingController();
  TextEditingController tecWeightGoals = TextEditingController();
  TextEditingController tecVerifCode = TextEditingController();

  bool get isSignUpIsPassed =>
      tecEmail.text != '' &&
      tecPhoneNumber.text != '' &&
      tecPassword.text != '' &&
      tecPasswordConfirm.text != ''
      // &&
      // tecCurrentWeight.text != '' &&
      // tecWeightGoals.text != ''
      ;

  Future<void> doSignUp() async {
    if (isSignUpIsPassed) {
      emit(SignUpLoading());
      try {
        await Amplify.Auth.signUp(
          username: tecEmail.text,
          password: tecPassword.text,
          options: SignUpOptions(userAttributes: {
            // AuthUserAttributeKey.phoneNumberVerified: tecPhoneNumber.text,
            // AuthUserAttributeKey.name: tecName.text,
            AuthUserAttributeKey.email: tecEmail.text,
          }),
        ).then((value) {
          logger.d('response : $value');
          emit(SignUpVerification());
        });
      } catch (e) {
        logger.d('error nya : ${e}');
        emit(SignUpError('error'));
        String errMsg = e
            .toString()
            .split('"message":')[1]
            .split(',')[0]
            .replaceAll('"', '');
        generalDialog.showGeneralSnackbar(
            message: errMsg != '' ? errMsg : stringConstant.generalMsgError,
            isError: true);
      }
    }
  }

  void verifyCodeSignUp() {}

  void gotoSignInFromRegister() {
    generalKeys.ctxRoute.replace(Routes.SIGN_IN);
  }

  void goBackToSignUp() => emit(SignUpInitial());
}
