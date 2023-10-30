part of dashboard_lib;

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const DashboardInitial());

  TextEditingController tecWeight = TextEditingController();
  TextEditingController tecName = TextEditingController();
  TextEditingController tecCurrentWeight = TextEditingController();
  TextEditingController tecWeightGoals = TextEditingController();

  var _listWeight = <WeigtTrackerUserModel>[];

  List attributeData = [];
  String? _userName;
  String? _currentWeight;
  String? _weightGoals;

  void sortDataNewest() {
    _listWeight.sort((a, b) => b.save_date!.compareTo(a.save_date!));
  }

  List<WeigtTrackerUserModel> get listWeight => _listWeight;

  String? get userName => _userName;

  String? get initialWeight => _currentWeight;

  String? get weightGoals => _weightGoals;

  void clearFieldWeight() {
    tecWeight.text = '';
    tecName.text = '';
    tecCurrentWeight.text = '';
    tecWeightGoals.text = '';
  }

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
    clearFieldWeight();
    await _fetchCurrentUserAttributes().then((_) {
      _userName = _getGenerateAttribute(argument: argument.name);
      _weightGoals = _getGenerateAttribute(argument: argument.weightGoals);
      _currentWeight = _getGenerateAttribute(argument: argument.currentWeight);
      getDataWeight().then((_) {
        emit(DashboardUserLoaded());
        logger.d('data weight : $_listWeight');
      });
    });
  }

  Future<void> reloadWeightData() async {
    emit(DashboardLoading());
    getDataWeight().then((_) => emit(DashboardUserLoaded()));
  }

  Future<void> getDataWeight() async {
    clearFieldWeight();
    try {
      final String userId = _getGenerateAttribute(argument: argument.userId);
      _listWeight = await Amplify.DataStore.query(
          WeigtTrackerUserModel.classType,
          where: WeigtTrackerUserModel.USER_ID.eq(userId));
      sortDataNewest();
    } catch (_) {}
  }

  void editWeightGoals() {
    generalDialog.showDialogWeightManagement(
      textEditingController: tecWeight,
      title: stringConstant.editWeightGoals,
      btnTitle: stringConstant.updateData,
      function: () async {
        try {
          generalKeys.ctxRoute.pop();
          emit(DashboardLoading());
          await Amplify.Auth.updateUserAttribute(
            userAttributeKey:
                const CognitoUserAttributeKey.custom('weightGoals'),
            value: tecWeight.text,
          ).then((_) {
            setDataDashboard();
          });
        } on AuthException catch (e) {
          emit(DashboardError('error'));
          generalDialog.showGeneralSnackbar(
              message: e.message.split(":").last, isError: true);
          setDataDashboard();
        } catch (e) {
          emit(DashboardError('error'));
          generalDialog.showGeneralSnackbar(
              message: stringConstant.generalMsgError, isError: true);
          setDataDashboard();
        }
      },
    );
  }

  void addDataWeight() {
    generalDialog.showDialogWeightManagement(
      textEditingController: tecWeight,
      title: stringConstant.addWeightMsg,
      btnTitle: stringConstant.createData,
      function: () async {
        final String userId = _getGenerateAttribute(argument: argument.userId);
        WeigtTrackerUserModel newWeight = WeigtTrackerUserModel(
          user_id: userId,
          save_date: TemporalDateTime(DateTime.now()),
          currentWeight: double.parse(tecWeight.text),
        );
        try {
          await Amplify.DataStore.save(newWeight).then((_) {
            generalKeys.ctxRoute.pop();
            reloadWeightData();
          });
        } catch (e) {
          emit(DashboardError('error'));
          generalDialog.showGeneralSnackbar(
              message: stringConstant.generalMsgError, isError: true);
        }
      },
    );
  }

  void editDataWeight({required String id}) {
    generalDialog.showDialogWeightManagement(
      textEditingController: tecWeight,
      title: stringConstant.editWeightMsg,
      btnTitle: stringConstant.updateData,
      function: () async {
        final String userId = _getGenerateAttribute(argument: argument.userId);
        // WeigtTrackerUserModel oldData = (await Amplify.DataStore.query(
        //     WeigtTrackerUserModel.classType,
        //     where: WeigtTrackerUserModel.USER_ID
        //         .eq(userId)
        //         .and(WeigtTrackerUserModel.ID.eq(id))))[0];
        WeigtTrackerUserModel newData = WeigtTrackerUserModel(
          id: id,
          user_id: userId,
          save_date: TemporalDateTime(DateTime.now()),
          currentWeight: double.parse(tecWeight.text),
        );
        try {
          await Amplify.DataStore.save(newData).then((_) {
            generalKeys.ctxRoute.pop();
            reloadWeightData();
          });
        } catch (_) {
          emit(DashboardError('error'));
          generalDialog.showGeneralSnackbar(
              message: stringConstant.generalMsgError, isError: true);
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
              await Amplify.DataStore.delete(element).then((_) {
                generalKeys.ctxRoute.pop();
                reloadWeightData();
              });
            } catch (e) {
              logger.d('error : $e');
              emit(DashboardError('error'));
              generalDialog.showGeneralSnackbar(
                  message: stringConstant.generalMsgError, isError: true);
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
              _listWeight.clear();
              generalKeys.ctxRoute.pop();
              emit(DashboardInitial());
              gotoSignInFromDashboard();
            }),
        btnRightAction: () => generalKeys.ctxRoute.pop());
  }

  void editProfileDashboard() {
    generalDialog.showDialogEditProfile(
      title: stringConstant.editProfile,
      btnTitle: stringConstant.updateData,
      fieldTitle: [
        stringConstant.name,
        stringConstant.currentWeight,
        stringConstant.weightGoals
      ],
      function: () async {
        try {
          generalKeys.ctxRoute.pop();
          emit(DashboardLoading());
          await Amplify.Auth.updateUserAttributes(attributes: [
            AuthUserAttribute(
              userAttributeKey: AuthUserAttributeKey.name,
              value: tecName.text,
            ),
            AuthUserAttribute(
              userAttributeKey: const CognitoUserAttributeKey.custom('currentWeight'),
              value: tecCurrentWeight.text,
            ),
            AuthUserAttribute(
              userAttributeKey: const CognitoUserAttributeKey.custom('weightGoals'),
              value: tecWeightGoals.text,
            ),
          ]).then((_) {
            setDataDashboard();
          });
        } on AuthException catch (e) {
          emit(DashboardError('error'));
          generalDialog.showGeneralSnackbar(
              message: e.message.split(":").last, isError: true);
          setDataDashboard();
        } catch (e) {
          emit(DashboardError('error'));
          generalDialog.showGeneralSnackbar(
              message: stringConstant.generalMsgError, isError: true);
          setDataDashboard();
        }
      },
      tec: [tecName, tecCurrentWeight, tecWeightGoals],
    );
  }

  void gotoSignInFromDashboard() {
    generalKeys.ctxRoute.replace(Routes.SIGN_IN);
  }
}
