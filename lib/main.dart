import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:travely_app/bloc/landing_hint_bloc.dart';
import 'package:travely_app/ui/landing/landing_page.dart';
import 'package:travely_app/ui/landing/tutorial_page.dart';

void main() {
  BlocOverrides.runZoned(() {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LandingHintBloc(),
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          routeInformationProvider: _goRouter.routeInformationProvider,
          routeInformationParser: _goRouter.routeInformationParser,
          routerDelegate: _goRouter.routerDelegate,
          title: 'Travely',
        );
      }),
    );
  }
}

final GoRouter _goRouter = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const LandingPage(), routes: [
    GoRoute(
      path: 'landing',
      name: TutorialPage.routeName,
      builder: (context, state) => TutorialPage(),
    ),
  ]),
]);
