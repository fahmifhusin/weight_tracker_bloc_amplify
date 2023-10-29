part of sign_up_lib;

@immutable
abstract class SignUpState {
  const SignUpState();
}

class SignUpInitial extends SignUpState {
  const SignUpInitial();
}

class SignUpLoading extends SignUpState {
  const SignUpLoading();
}

class SignUpVerification extends SignUpState {
  const SignUpVerification();
}

class SignUpSuccess extends SignUpState {
  const SignUpSuccess();
}

class SignUpFormVerified extends SignUpState {
  const SignUpFormVerified();
}

class SignUpFormCodeVerified extends SignUpState {
  const SignUpFormCodeVerified();
}

class SignUpLoadCodeVerified extends SignUpState {
  const SignUpLoadCodeVerified();
}

class SignUpError extends SignUpState {
  final String message;
  const SignUpError(this.message);
}