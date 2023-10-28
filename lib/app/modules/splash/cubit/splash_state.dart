part of splash_lib;

@immutable
abstract class SplashState {
  const SplashState();
}

class SplashInitial extends SplashState {
  const SplashInitial();
}

class SplashLoading extends SplashState {
  const SplashLoading();
}

class SplashSuccess extends SplashState {
  const SplashSuccess();
}

class SplashError extends SplashState {
  final String message;

  const SplashError(this.message);
}