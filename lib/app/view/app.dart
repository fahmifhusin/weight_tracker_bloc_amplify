import 'package:flutter/material.dart';
import 'package:weight_tracker/app/splash/view/splash_view.dart';

import '../counter/view/counter_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      // home: const CounterPage(),
      home: const SplashView(),
    );
  }
}
