import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'forgotpassword_state.dart';

class ForgotpasswordCubit extends Cubit<ForgotpasswordState> {
  ForgotpasswordCubit() : super(const ForgotpasswordState());

  onEmailChange(String email) {
    emit(state.copyWith(email: email));
  }

  onChaptcha() {
    var value = state.captcha;
    value ? value = false : value = true;
    emit(state.copyWith(captcha: value));
  }
}
