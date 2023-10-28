part of sign_in_lib;

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(const SignInInitial());

  TextEditingController tecEmailOrPhone = TextEditingController();
  TextEditingController tecPassword = TextEditingController();

  bool get isSignInDataIsValid => tecEmailOrPhone.text != '' && tecPassword != '';

  void doSignIn(){
    if(isSignInDataIsValid){
      ///load api
      emit(SignInLoading());
      logger.d('email or phone : ${tecEmailOrPhone.text}');
      logger.d('password : ${tecPassword.text}');
      Future.delayed(const Duration(milliseconds: 1000), () {
        emit(SignInSuccess());
      });
    }
  }

  void gotoSignupFromLogin(){
    generalKeys.ctxRoute.replace(Routes.SIGN_UP);
  }
}