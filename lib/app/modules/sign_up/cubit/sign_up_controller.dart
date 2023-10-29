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
      tecPasswordConfirm.text != '' &&
      tecPassword.text == tecPasswordConfirm.text
      // &&
      // tecCurrentWeight.text != '' &&
      // tecWeightGoals.text != ''
      ;

  void clearFieldSignUp() {
    tecName.text = '';
    tecEmail.text = '';
    tecPhoneNumber.text = '';
    tecPassword.text = '';
    tecPasswordConfirm.text = '';
    tecVerifCode.text = '';
  }

  bool get isVerifyFieldIsPassed => tecVerifCode.text != '';

  void verifySignUpForm() {
    isSignUpIsPassed ? emit(SignUpFormVerified()) : emit(SignUpInitial());
  }

  void verifySignUpVerificationForm() {
    isVerifyFieldIsPassed
        ? emit(SignUpFormCodeVerified())
        : emit(SignUpVerification());
  }

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
      } on AuthErrorResult catch (e) {
        emit(SignUpError('error'));
        generalDialog.showGeneralSnackbar(
            message: e.exception.message, isError: true);
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

  Future<void> verifyCodeSignUp() async {
    if (isVerifyFieldIsPassed) {
      emit(SignUpLoadCodeVerified());
      try {
        await Amplify.Auth.confirmSignUp(
                username: tecEmail.text, confirmationCode: tecVerifCode.text)
            .then((value) {
          logger.d('result is :${value}');
          generalDialog.showGeneralSnackbar(
            message: stringConstant.successVerify,
            customColor: Colors.lightGreen,
            isError: false,
          );
          emit(SignUpSuccess());
          gotoSignInFromRegister();
        });
      } on AuthErrorResult catch (e) {
        emit(SignUpVerification());
        generalDialog.showGeneralSnackbar(
            message: e.exception.message, isError: true);
      } catch (e) {
        logger.d('error nya : ${e}');
        emit(SignUpVerification());
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

  void gotoSignInFromRegister() {
    clearFieldSignUp();
    generalKeys.ctxRoute.replace(Routes.SIGN_IN);
  }

  void goBackToSignUp() => emit(SignUpInitial());
}
