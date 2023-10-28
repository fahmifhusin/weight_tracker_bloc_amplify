abstract class Routes {
  Routes._();

  static const SPLASH = _Path.SPLASH;
  static const COUNTER = _Path.COUNTER;
}

abstract class _Path {
  _Path._();

  static const SPLASH = '/';
  static const COUNTER = '/counter';
}
