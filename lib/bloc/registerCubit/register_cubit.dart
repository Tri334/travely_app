import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:formz/formz.dart';
import 'package:travely_app/models/form_validator/confirm_password.dart';
import 'package:travely_app/models/form_validator/email.dart';
import 'package:travely_app/models/form_validator/password.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  emailChange(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
        email: email,
        status:
            Formz.validate([email, state.password, state.confirmPassword])));
  }

  usernameChange(String value) {
    emit(state.copyWith(userName: value));
  }

  phoneChange(String value) {
    emit(state.copyWith(phone: value));
  }

  passwordChange(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
        password: password,
        status:
            Formz.validate([state.email, password, state.confirmPassword])));
  }

  confirmPassword(String value) {
    final confirmPassword =
        ConfirmPassword.dirty(password: state.password.value, value: value);
    emit(state.copyWith(
        confirmPassword: confirmPassword,
        status:
            Formz.validate([state.email, state.password, confirmPassword])));
  }

  checkTermCondition() {
    bool value = state.termCondition;
    value ? value = false : value = true;
    emit(state.copyWith(termCondition: value));
  }

  Future signUpEmailAndPassword() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: state.email.value, password: state.password.value)
          .then((value) => emit(state.copyWith(
              status: FormzStatus.submissionSuccess,
              user: FirebaseAuth.instance.currentUser)));
    } catch (e) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
