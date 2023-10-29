import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_tracker/constant/constants.dart';
import 'package:weight_tracker/router/app_pages.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    functionSharing.configureAmplify();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
        providers: generalKeys.listBlocProvider,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppPages.routePages,

          ///use go router
        ));
  }
}
