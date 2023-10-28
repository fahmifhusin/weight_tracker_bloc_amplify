part of shared_components;

class FunctionSharing {
  static final FunctionSharing _functionSharing = FunctionSharing._internal();

  FunctionSharing._internal();

  factory FunctionSharing() {
    return _functionSharing;
  }

  double get screenWidth => MediaQuery.of(generalKeys.ctxRoute).size.width;
  double get screenHeight => MediaQuery.of(generalKeys.ctxRoute).size.height;
}
