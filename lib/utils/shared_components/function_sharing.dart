part of shared_components;

class FunctionSharing {
  static final FunctionSharing _functionSharing = FunctionSharing._internal();

  FunctionSharing._internal();

  factory FunctionSharing() {
    return _functionSharing;
  }

  Future<void> configureAmplifyInstance() async {
    final authPlugin = AmplifyAuthCognito();
    final datastorePlugin = AmplifyDataStore(modelProvider: ModelProvider.instance);
    await Amplify.addPlugins([authPlugin,datastorePlugin]);
    try {
      await Amplify.configure(amplifyconfig).then((_) => Amplify.Auth.signOut());
    } on AmplifyAlreadyConfiguredException {
      logger.d(
          'Tried to reconfigure Amplify; this can occur when your app restarts on Android.');
    }
  }



  Future <AuthUser?> getUserData() async {
     AuthUser? userData;
    await Amplify.Auth.getCurrentUser().then((value) => userData = value);
    return userData;
  }

  double get screenWidth => MediaQuery.of(generalKeys.ctxRoute).size.width;
  double get screenHeight => MediaQuery.of(generalKeys.ctxRoute).size.height;
}
