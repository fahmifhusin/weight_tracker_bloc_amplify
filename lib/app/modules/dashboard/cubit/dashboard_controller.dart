part of dashboard_lib;

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const DashboardInitial());

  List _dummyListWeight = [
    {argument.currentWeight: '50', argument.saveDate: '1 Oct 2020'},
    {argument.currentWeight: '50', argument.saveDate: '1 Oct 2020'},
    {argument.currentWeight: '50', argument.saveDate: '1 Oct 2020'},
    {argument.currentWeight: '50', argument.saveDate: '1 Oct 2020'},
    {argument.currentWeight: '50', argument.saveDate: '1 Oct 2020'},
    {argument.currentWeight: '50', argument.saveDate: '1 Oct 2020'},
  ];

  List attributeData = [];
  String? _userName;
  String? _currentWeight;
  String? _weightGoals;

  List get listWeight => _dummyListWeight;

  String? get userName => _userName;

  String? get initialWeight => _currentWeight;

  String? get weightGoals => _weightGoals;

  Future<void> _fetchCurrentUserAttributes() async {
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

  String _getGenerateAttribute({required String argument}) {
    String value = '';
    for (int i = 0; i < attributeData.length; i++) {
      if (attributeData[i].toString().contains(argument)) {
        value = attributeData[i].toString().split(':').last.replaceAll('}', '');
      }
    }
    return value;
  }

  Future<void> setDataDashboard() async {
    await _fetchCurrentUserAttributes().then((_) {
      _userName = _getGenerateAttribute(argument: argument.name);
      _weightGoals = _getGenerateAttribute(argument: argument.weightGoals);
      _currentWeight = _getGenerateAttribute(argument: argument.currentWeight);
      emit(DashboardUserLoaded());
    });
  }

  void addDataWeight() {
    generalDialog.showDialogWeightManagement(
      title: stringConstant.addWeightMsg,
      btnTitle: stringConstant.add,
      function: () => logger.d('tap'),
    );
  }

  void editDataWeight() {
    generalDialog.showDialogWeightManagement(
      title: stringConstant.editWeightMsg,
      btnTitle: stringConstant.edit,
      function: () => logger.d('tap'),
    );
  }

  void deleteDataWeight() {
    generalDialog.showDialogConfirmation(
        titleMsg: stringConstant.signOutConfirmationMsg,
        titleBtnLeft: stringConstant.delete,
        titleBtnRight: stringConstant.cancel,
        btnLeftAction: (){
          logger.d('tap');
          generalKeys.ctxRoute.pop();
        },
        btnRightAction: () => generalKeys.ctxRoute.pop());
  }

  void logoutFromDashboard() {
    generalDialog.showDialogConfirmation(
        titleMsg: stringConstant.signOutConfirmationMsg,
        titleBtnLeft: stringConstant.signOut,
        titleBtnRight: stringConstant.no,
        btnLeftAction: () =>
            Amplify.Auth.signOut().then((_){
              generalKeys.ctxRoute.pop();
              gotoSignInFromDashboard();
            }),
        btnRightAction: () => generalKeys.ctxRoute.pop());
  }

  void gotoSignInFromDashboard() {
    generalKeys.ctxRoute.replace(Routes.SIGN_IN);
  }
}
