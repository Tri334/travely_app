import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'login_state.dart';

class LoginCubit extends HydratedCubit<LoginState> {
  LoginCubit() : super(const LoginState());

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

  Future signInWithEmailAndPassword() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: state.email, password: state.password);
  }

  @override
  LoginState? fromJson(Map<String, dynamic> json) {
    return LoginState(email: json['email']);
  }

  @override
  Map<String, dynamic>? toJson(LoginState state) {
    return state.remember ? <String, dynamic>{'email': state.email} : null;
  }
}
