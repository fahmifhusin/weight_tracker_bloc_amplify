part of constants;

class StringConstant{
  static final StringConstant _stringConstant = StringConstant._internal();

  StringConstant._internal();

  factory StringConstant() {
    return _stringConstant;
  }

  ///splash
  final String weightTracker = 'Weight Tracker';

  ///sign up
  final String headerSignUp = 'Embark on your journey to a healthier you with our\nWeight Tracker app';
  final String signUp = 'Sign Up';
  final String emailOrPhone = 'Email / Phone Number';
  final String name = 'Full Name';
  final String email = 'Email';
  final String phoneNumber = 'Phone Number';
  final String password = 'Password';
  final String confirmPassword = 'Confirm Password';
  final String currentWeight ='Current Weight';
  final String weightGoals = 'Weight Goals';
  final String or = 'or';
  final String alreadyHaveAccount = 'Already have an account? ';

  ///sign in
  final String signInHeader = 'Sign In to access your\nWeight Tracker & Activity';
  final String signIn = 'Sign in';
  final String dontHaveAccount = 'Don\'t have an account? ';


  ///env
  final String development = 'Development';
  final String staging = 'Staging';
  final String production = 'Production';

}
