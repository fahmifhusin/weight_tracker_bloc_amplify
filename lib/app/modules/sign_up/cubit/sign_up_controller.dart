part of sign_up_lib;

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpInitial());
  void gotoSignInFromRegister(){
    generalKeys.ctxRoute.replace(Routes.SIGN_IN);
  }

}