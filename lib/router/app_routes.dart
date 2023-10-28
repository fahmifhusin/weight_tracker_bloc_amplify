abstract class Routes {
  Routes._();

  static const SPLASH = _Path.SPLASH;
  static const SIGN_IN = _Path.SIGN_IN;
}

abstract class _Path {
  _Path._();

  static const SPLASH = '/';
  static const SIGN_IN = '/sign_in';
}
