import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travely_app/bloc/landing_hint_bloc.dart';
import 'package:travely_app/models/landing_model.dart';
import 'package:travely_app/models/login_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travely_app/models/color_model.dart';

part 'ui/landing/tutorial_page.dart';
part 'ui/landing/landing_page.dart';
part 'ui/login/login_page.dart';
part 'ui/login/register_page.dart';
part 'ui/widgets/custom_button.dart';
part 'ui/widgets/custom_input.dart';

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
        name: 'landing',
        builder: (context, state) => TutorialPage(),
        routes: []),
  ]),
  GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => LoginPage(),
      routes: [
        GoRoute(
          path: 'sign_up',
          name: 'sign_up',
          builder: (context, state) => RegisterPage(),
        )
      ]),
]);
