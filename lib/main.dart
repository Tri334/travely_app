import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travely_app/bloc/forgot_password/forgotpassword_cubit.dart';
import 'package:travely_app/bloc/landing_hint/landing_hint_bloc.dart';
import 'package:travely_app/bloc/loginCubit/login_cubit.dart';
import 'package:travely_app/bloc/observer_bloc.dart';
import 'package:travely_app/bloc/otp_verification/otp_verification_bloc.dart';
import 'package:travely_app/bloc/registerCubit/register_cubit.dart';
import 'package:travely_app/bloc/verify/verify_cubit.dart';
import 'package:travely_app/firebase_options.dart';
import 'package:travely_app/models/img_model.dart';
import 'package:travely_app/models/landing_model.dart';
import 'package:travely_app/models/login_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travely_app/models/color_model.dart';
import 'package:travely_app/models/tes_model.dart';
import 'package:travely_app/models/travely_icons_icons.dart';

part 'ui/landing/tutorial_page.dart';
part 'ui/landing/landing_page.dart';
part 'ui/login/login_page.dart';
part 'ui/login/register_page.dart';
part 'ui/home/home_page.dart';
part 'ui/login/otp_verification.dart';
part 'ui/login/verify_page.dart';
part 'ui/login/forgot_password.dart';
part 'ui/widgets/custom_button.dart';
part 'ui/widgets/custom_input_register.dart';
part 'ui/widgets/custom_input_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  HydratedBloc.storage = storage;
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LandingHintBloc(),
        ),
        BlocProvider(
          create: (context) => OtpVerificationBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => VerifyCubit(),
        ),
        BlocProvider(
          create: (context) => ForgotpasswordCubit(),
        ),
      ],
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
  GoRoute(
    path: '/',
    name: '/',
    builder: (context, state) => FirebaseAuth.instance.currentUser != null
        ? const HomePage()
        : const LandingPage(),
  ),
  GoRoute(
      path: '/landing',
      name: 'landing',
      builder: (context, state) => const LandingPage(),
      routes: [
        GoRoute(
          path: 'tutor',
          name: 'tutor',
          builder: (context, state) => TutorialPage(),
        ),
      ]),
  GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => LoginPage(),
      routes: [
        GoRoute(
          path: 'sign_up',
          name: 'sign_up',
          builder: (context, state) => const RegisterPage(),
        ),
        GoRoute(
          path: 'otp_verification',
          name: 'otp_verification',
          builder: (context, state) => OtpVerification(),
        ),
        GoRoute(
          path: 'verify',
          name: 'verify',
          builder: (context, state) {
            User? object = state.extra as User?;
            return VerifyPage(
              user: object,
            );
          },
        ),
        GoRoute(
          path: 'forgot_password',
          name: 'forgot_password',
          builder: (context, state) => ForgotPasswordPage(),
        )
      ]),
  GoRoute(
    path: '/home',
    name: 'home',
    builder: (context, state) => const HomePage(),
  )
]);
