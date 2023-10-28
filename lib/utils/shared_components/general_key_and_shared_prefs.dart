part of shared_components;

class GeneralKeyAndSharedPrefs {
  static final GeneralKeyAndSharedPrefs _generalSharedPrefs =
      GeneralKeyAndSharedPrefs._internal();

  GeneralKeyAndSharedPrefs._internal();

  factory GeneralKeyAndSharedPrefs() {
    return _generalSharedPrefs;
  }

  late SharedPreferences prefsInstance;

  final String roboto = 'Roboto';

  final List<BlocProvider> listBlocProvider = [
    BlocProvider<SplashCubit>(create: (_)=>SplashCubit()),
    BlocProvider<SignInCubit>(create: (_)=>SignInCubit()),
    BlocProvider<SignUpCubit>(create: (_)=>SignUpCubit()),
  ];

  BuildContext get ctxRoute => AppPages.routePages.routerDelegate.navigatorKey.currentContext!;
}
