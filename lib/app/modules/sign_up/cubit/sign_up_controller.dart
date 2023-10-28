part of sign_up_lib;

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpInitial());

  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecPhoneNumber = TextEditingController();
  TextEditingController tecPassword = TextEditingController();
  TextEditingController tecPasswordConfirm = TextEditingController();
  TextEditingController tecCurrentWeight = TextEditingController();
  TextEditingController tecWeightGoals = TextEditingController();

  bool get isSignUpIsPasseed =>
      tecEmail.text != '' && tecPhoneNumber.text != '' &&
          tecPassword.text != '' && tecPasswordConfirm.text != '' &&
          tecCurrentWeight.text != '' && tecWeightGoals.text != '';

  void doSignUp() {
    if (isSignUpIsPasseed) {
      ///load api
      emit(SignUpLoading());
      Future.delayed(const Duration(milliseconds: 1000), () {
        emit(SignUpSuccess());
      });
    }
  }

  void gotoSignInFromRegister() {
    generalKeys.ctxRoute.replace(Routes.SIGN_IN);
  }

}