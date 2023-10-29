part of sign_in_lib;

@immutable
abstract class SignInState {
  const SignInState();
}

class SignInInitial extends SignInState {
  const SignInInitial();
}

class SignInLoading extends SignInState {
  const SignInLoading();
}

class SignInFormVerified extends SignInState {
  const SignInFormVerified();
}


class SignInSuccess extends SignInState {
  const SignInSuccess();
}

class SignInError extends SignInState {
  final String message;

  const SignInError(this.message);
}