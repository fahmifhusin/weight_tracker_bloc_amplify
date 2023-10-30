part of dashboard_lib;

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const DashboardInitial());

  TextEditingController tecWeight = TextEditingController();

  var _listWeight = <WeigtTrackerUserModel>[];

  List attributeData = [];
  String? _userName;
  String? _currentWeight;
  String? _weightGoals;

  void sortDataNewest(){
    _listWeight.sort((a, b) => b.save_date!.compareTo(a.save_date!));
  }

  List<WeigtTrackerUserModel> get listWeight => _listWeight;

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
      getDataWeight().then((_) {
        sortDataNewest();
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
    try {
      final String userId = _getGenerateAttribute(argument: argument.userId);
      _listWeight =
          await Amplify.DataStore.query(WeigtTrackerUserModel.classType
              ,where: WeigtTrackerUserModel.USER_ID
              .eq(userId)
          );
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
          save_date: TemporalDateTime(DateTime.now()),
          currentWeight: double.parse(tecWeight.text),
        );
        try {
          await Amplify.DataStore.save(newWeight).then((_){
            generalKeys.ctxRoute.pop();
            reloadWeightData();
          });
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
                  .then((_){
                generalKeys.ctxRoute.pop();
                reloadWeightData();
              });
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
              _listWeight.clear();
              generalKeys.ctxRoute.pop();
              emit(DashboardInitial());
              gotoSignInFromDashboard();
            }),
        btnRightAction: () => generalKeys.ctxRoute.pop());
  }

  void gotoSignInFromDashboard() {
    generalKeys.ctxRoute.replace(Routes.SIGN_IN);
  }
}
