import 'package:go_router/go_router.dart';

import '../app/module/splash/view/splash_view.dart';
import 'app_routes.dart';

class AppPages{
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routePages = GoRouter(
    initialLocation: INITIAL,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.SPLASH,
        builder: (context, state) => SplashView(),
      ),
    ],
  ); 
}
