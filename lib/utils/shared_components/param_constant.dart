part of shared_components;

class ParamConstant {
  static final ParamConstant _paramConstant = ParamConstant._internal();

  ParamConstant._internal();

  factory ParamConstant() {
    return _paramConstant;
  }

  final String weightGoals = 'custom:weightgoals';
  final String name = 'name';
  final String phoneNumber = 'phone_number';
  final String initialWeight = 'initWeight';
  final String currentWeight = 'custom:currentweight';
  final String email = 'email';
  final String saveDate = 'saveDate';
  final String userId = 'sub';


}