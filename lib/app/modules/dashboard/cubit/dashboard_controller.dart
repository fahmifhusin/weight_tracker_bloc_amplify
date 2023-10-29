part of dashboard_lib;

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const DashboardInitial());
  List attributeData = [];
  String? _userName;
  String? _currentWeight;
  String? _weightGoals;

  String? get userName => _userName;

  String? get currentWeight => _currentWeight;

  String? get weightGoals => _weightGoals;

  Future<void> fetchCurrentUserAttributes() async {
    try {
      final result = await Amplify.Auth.fetchUserAttributes();
      for (final element in result) {
        logger.d('key: ${element.userAttributeKey}; value: ${element.value}');
        attributeData.add({"${element.userAttributeKey}": "${element.value}"});
      }
    } on AuthException catch (e) {
      safePrint('Error fetching user attributes: ${e.message}');
    }
  }

  String getGenerateAttribute({required String argument}) {
    String value = '';
    for (int i = 0; i < attributeData.length; i++) {
      if (attributeData[i].toString().contains(argument)) {
        value = attributeData[i].toString().split(':').last.replaceAll('}', '');
      }
    }
    return value;
  }

  Future<void> getUserLoggedIn() async {
    await fetchCurrentUserAttributes().then((value) {
      _userName = getGenerateAttribute(argument: argument.name);
      _weightGoals = getGenerateAttribute(argument: argument.weightGoals);
      _currentWeight = getGenerateAttribute(argument: argument.currentWeight);
      emit(DashboardUserLoaded());
    });
  }

  void logoutFromDashboard() {
    Amplify.Auth.signOut().then((_) => gotoSignInFromDashboard());
  }

  void gotoSignInFromDashboard() {
    generalKeys.ctxRoute.replace(Routes.SIGN_IN);
  }
}
