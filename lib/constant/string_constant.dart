part of constants;

class StringConstant {
  static final StringConstant _stringConstant = StringConstant._internal();

  StringConstant._internal();

  factory StringConstant() {
    return _stringConstant;
  }

  ///splash
  final String weightTracker = 'Weight Tracker';

  ///sign up
  final String headerSignUp =
      'Embark on your journey to a healthier you with our\nWeight Tracker app';
  final String headerSignUpVerification = 'We have sent a verification code to';
  final String signUp = 'Sign Up';
  final String emailOrPhone = 'Email / Phone Number';
  final String name = 'Full Name';
  final String email = 'Email';
  final String phoneNumber = 'Phone Number';
  final String password = 'Password';
  final String confirmPassword = 'Confirm Password';
  final String currentWeight = 'Current Weight (Kg)';
  final String weightGoals = 'Weight Goals (Kg)';
  final String or = 'or';
  final String alreadyHaveAccount = 'Already have an account? ';
  final String verifySignUp = 'Verify my Account';
  final String verificationCode = 'Verification Code';
  final String successVerify ='Register account Success!';
  final String hi = 'Hi,';

  ///sign in
  final String signInHeader =
      'Sign In to access your\nWeight Tracker & Activity';
  final String signIn = 'Sign in';
  final String dontHaveAccount = 'Don\'t have an account? ';

  ///dashboard
  final String signOut = 'Sign Out';
  final String kilo = 'Kg';
  final String initialWeight = 'Initial Weight';
  final String yourWeight = 'Your Weight';
  final String yourCurrentWeight = 'Your Current Weight';
  final String yourGoals = 'Your Goals';
  final String hello = 'Hello, ';
  final String add = 'Add';
  final String edit = 'Edit';
  final String delete = 'Delete';
  final String signOutConfirmationMsg = 'Are you sure?';
  final String addWeightData = 'Add Weight Data';
  final String addWeightMsg = 'Insert your current weight';
  final String editWeightMsg = 'Edit your weight data';

  ///other
  final String generalMsgError = 'An error occurred, please try again in a few moments.';
  final String appTitle = 'Weight Tracker';
  final String yes = 'Yes';
  final String cancel = 'Cancel';
  final String no = 'No';

  ///env
  final String development = 'Development';
  final String staging = 'Staging';
  final String production = 'Production';
}
