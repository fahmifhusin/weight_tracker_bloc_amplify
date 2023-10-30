part of dashboard_lib;

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const DashboardInitial());

  TextEditingController tecWeight = TextEditingController();

  var _listWeight = <WeigtTrackerUserModel>[];

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
      logger.d('data weight : $_listWeight');
      getDataWeight().then((_) async => emit(DashboardUserLoaded()));
    });
  }

  Future<void> getDataWeight() async {
    try {
      _listWeight =
          await Amplify.DataStore.query(WeigtTrackerUserModel.classType);
    } catch (_) {}
  }

  void addDataWeight() {
    generalDialog.showDialogWeightManagement(
      textEditingController: tecWeight,
      title: stringConstant.addWeightMsg,
      btnTitle: stringConstant.add,
      function: () async {
        final String userId = _getGenerateAttribute(argument: argument.userId);
        WeigtTrackerUserModel newWeight = WeigtTrackerUserModel(
          user_id: userId,
          save_date: TemporalDate(DateTime.now()),
          currentWeight: double.parse(tecWeight.text),
        );
        try {
          await Amplify.DataStore.save(newWeight);
        } catch (e) {
          logger.d('error : $e');
        }
      },
    );
  }

  void editDataWeight({required String id}) {
    generalDialog.showDialogWeightManagement(
      textEditingController: tecWeight,
      title: stringConstant.editWeightMsg,
      btnTitle: stringConstant.edit,
      function: () async {
        final String userId = _getGenerateAttribute(argument: argument.userId);
        WeigtTrackerUserModel oldData = (await Amplify.DataStore.query(
            WeigtTrackerUserModel.classType,
            where: WeigtTrackerUserModel.USER_ID
                .eq(userId)
                .and(WeigtTrackerUserModel.ID.eq(id))))[0];
        WeigtTrackerUserModel newData = WeigtTrackerUserModel(
          id: id,
          user_id: userId,
          save_date: TemporalDate(DateTime.now()),
          currentWeight: double.parse(tecWeight.text),
        );
        try {
          await Amplify.DataStore.save(newData);
        } catch (e) {
          logger.d('error : $e');
        }
      },
    );
  }

  void deleteDataWeight({required String id}) {
    generalDialog.showDialogConfirmation(
        titleMsg: stringConstant.signOutConfirmationMsg,
        titleBtnLeft: stringConstant.delete,
        titleBtnRight: stringConstant.cancel,
        btnLeftAction: () async {
          (await Amplify.DataStore.query(WeigtTrackerUserModel.classType,
                  where: WeigtTrackerUserModel.ID.eq(id)))
              .forEach((element) async {
            try {
              await Amplify.DataStore.delete(element)
                  .then((_) => generalKeys.ctxRoute.pop());
            } catch (e) {
              logger.d('error : $e');
            }
          });
        },
        btnRightAction: () => generalKeys.ctxRoute.pop());
  }

  void logoutFromDashboard() {
    generalDialog.showDialogConfirmation(
        titleMsg: stringConstant.signOutConfirmationMsg,
        titleBtnLeft: stringConstant.signOut,
        titleBtnRight: stringConstant.no,
        btnLeftAction: () => Amplify.Auth.signOut().then((_) {
              generalKeys.ctxRoute.pop();
              gotoSignInFromDashboard();
            }),
        btnRightAction: () => generalKeys.ctxRoute.pop());
  }

  void gotoSignInFromDashboard() {
    generalKeys.ctxRoute.replace(Routes.SIGN_IN);
  }
}
