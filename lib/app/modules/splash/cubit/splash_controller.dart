part of splash_lib;

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashInitial());

  void loadSplashScreen(){
    emit(SplashLoading());
    Future.delayed(const Duration(milliseconds: 3000), () {
    emit(SplashSuccess());
    });
  }

  void gotoSignUpPageFromSplash(){
    functionSharing.ctxRoute.go(Routes.SIGN_UP);
  }
  
}