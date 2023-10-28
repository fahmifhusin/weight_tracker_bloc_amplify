abstract class Routes {
  Routes._();

  static const SPLASH = _Path.SPLASH;
  static const SIGN_IN = _Path.SIGN_IN;
  static const SIGN_UP = _Path.SIGN_UP;
}

abstract class _Path {
  _Path._();

  static const SPLASH = '/';
  static const SIGN_IN = '/sign_in';
  static const SIGN_UP = '/sign_up';
}
