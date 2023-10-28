import 'package:go_router/go_router.dart';
import 'package:weight_tracker/app/module/counter/counter.dart';
import 'package:weight_tracker/constant/constants.dart';

import '../app/module/splash/splash_lib.dart';
import 'app_routes.dart';

class AppPages{
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routePages = GoRouter(
    initialLocation: INITIAL,
    debugLogDiagnostics: envName == stringConstant.development,
    routes: [
      GoRoute(
        path: Routes.SPLASH,
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: Routes.COUNTER,
        builder: (context, state) => CounterView(),
      ),
    ],
  ); 
}
