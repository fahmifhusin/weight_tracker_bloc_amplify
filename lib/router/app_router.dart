import 'package:go_router/go_router.dart';
import 'package:weight_tracker/app/splash/view/splash_view.dart';

class AppRouter{
  static final AppRouter _appRouter = AppRouter._internal();

  AppRouter._internal();

  factory AppRouter() {
    return _appRouter;
  }
// GoRouter configuration
  final page = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashView(),
      ),
    ],
  ); 
}