part of dashboard_lib;

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const DashboardInitial());
  AuthUser? dataUser;

  Future<void> getUserLoggedIn() async {
    await functionSharing.getUserData().then((value){
    dataUser = value;
    emit(DashboardUserLoaded());
    });
  }

  void logoutFromDashboard(){
    Amplify.Auth.signOut().then((_) => gotoSignInFromDashboard());
  }

  void gotoSignInFromDashboard(){
    generalKeys.ctxRoute.replace(Routes.SIGN_IN);
  }
}
