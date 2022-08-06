import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travely_app/ui/landing/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: _goRouter.routeInformationProvider,
      routeInformationParser: _goRouter.routeInformationParser,
      routerDelegate: _goRouter.routerDelegate,
      title: 'Travely',
    );
  }
}

final GoRouter _goRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const LandingPage(),
  ),
]);
