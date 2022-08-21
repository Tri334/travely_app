import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'login_state.dart';

class LoginCubit extends HydratedCubit<LoginState> {
  LoginCubit() : super(const LoginState());

  int timer = 10;

  loginEmail(String value) {
    emit(state.copyWith(email: value));
  }

  loginPassword(String value) {
    emit(state.copyWith(password: value));
  }

  checkRemember() {
    bool value = state.remember;
    value ? value = false : value = true;
    emit(state.copyWith(remember: value));
  }

  sendVerificationEmail() async {
    try {
      await state.user!.sendEmailVerification().then(
            (value) => emit(state.copyWith(
                verify: false, timer: timer, status: LoginStatus.loginSucces)),
          );
    } on FirebaseAuthException catch (_) {
      emit(state.copyWith(status: LoginStatus.loginFailure));
    }
  }

  onEventDecrement() {
    if (state.timer >= 1) {
      emit(state.copyWith(timer: state.timer - 1, verify: false));
    } else {
      emit(state.copyWith(timer: timer, verify: true));
    }
  }

  Future signInWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      )
          .then((_) async {
        var user = await FirebaseAuth.instance.currentUser;
        emit(state.copyWith(user: user, status: LoginStatus.loginSucces));
      });
    } on FirebaseAuthException catch (_) {
      emit(state.copyWith(status: LoginStatus.loginFailure));
    }
  }

  @override
  LoginState? fromJson(Map<String, dynamic> json) {
    return LoginState(email: json['email']);
  }

  @override
  Map<String, dynamic>? toJson(LoginState state) {
    return state.remember
        ? <String, dynamic>{
            'email': state.email,
          }
        : null;
  }
}
