part of constants;

class StringConstant{
  static final StringConstant _stringConstant = StringConstant._internal();

  StringConstant._internal();

  factory StringConstant() {
    return _stringConstant;
  }

  ///splash
  final String weightTracker = 'Weight Tracker';

  ///env
  final String development = 'Development';
  final String staging = 'Staging';
  final String production = 'Production';

}
