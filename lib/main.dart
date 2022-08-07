import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:travely_app/ui/landing/landing_page.dart';
import 'package:travely_app/ui/landing/tutorial_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp.router(
        routeInformationProvider: _goRouter.routeInformationProvider,
        routeInformationParser: _goRouter.routeInformationParser,
        routerDelegate: _goRouter.routerDelegate,
        title: 'Travely',
      );
    });
  }
}

final GoRouter _goRouter = GoRouter(routes: [
  GoRoute(
      path: LandingPage.routeName,
      builder: (context, state) => const LandingPage(),
      routes: [
        GoRoute(
          path: TutorialPage.routeName,
          builder: (context, state) => const TutorialPage(),
        ),
      ]),
]);
