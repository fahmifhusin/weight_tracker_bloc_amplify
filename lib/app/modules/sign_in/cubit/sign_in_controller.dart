part of sign_in_lib;

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(const SignInInitial());

  TextEditingController tecEmailOrPhone = TextEditingController();
  TextEditingController tecPassword = TextEditingController();

  bool get isSignInDataIsValid =>
      tecEmailOrPhone.text != '' && tecPassword.text != '';

  void verifySignUpForm() {
    isSignInDataIsValid ? emit(SignInFormVerified()) : emit(SignInInitial());
  }

  void clearFieldSignIn(){
    tecEmailOrPhone.text = '';
    tecPassword.text = '';
  }

  Future<void> doSignIn() async {
    if (isSignInDataIsValid) {
      ///load api
      emit(SignInLoading());
      try {
        await Amplify.Auth.signIn(
                username: tecEmailOrPhone.text, password: tecPassword.text)
            .then((value) {
          logger.d('result is :${value}');
          emit(SignInSuccess());
          gotoDashboardAfterLogin();
        });
      } on AuthErrorResult catch (e) {
        emit(SignInError('error'));
        generalDialog.showGeneralSnackbar(
            message: e.exception.message, isError: true);
      } catch (e) {
        logger.d('error nya : ${e}');
        emit(SignInError('error'));
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

  void gotoSignupFromLogin() {
    generalKeys.ctxRoute.replace(Routes.SIGN_UP);
  }

  void gotoDashboardAfterLogin() {
    clearFieldSignIn();
    generalKeys.ctxRoute.replace(Routes.DASHBOARD);
  }
}
