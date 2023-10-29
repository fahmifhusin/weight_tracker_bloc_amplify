part of shared_components;

class FunctionSharing {
  static final FunctionSharing _functionSharing = FunctionSharing._internal();

  FunctionSharing._internal();

  factory FunctionSharing() {
    return _functionSharing;
  }

  Future<void> configureAmplify() async {
    try {
      final auth = AmplifyAuthCognito();
      await Amplify.addPlugin(auth);

      // call Amplify.configure to use the initialized categories in your app
      await Amplify.configure(amplifyconfig);
    } on Exception catch (e) {
      logger.d('An error occurred configuring Amplify: $e');
    }
  }

  double get screenWidth => MediaQuery.of(generalKeys.ctxRoute).size.width;
  double get screenHeight => MediaQuery.of(generalKeys.ctxRoute).size.height;
}
