part of sign_in_lib;

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(const SignInInitial());

  void gotoSignupFromLogin(){
    generalKeys.ctxRoute.replace(Routes.SIGN_UP);
  }
}