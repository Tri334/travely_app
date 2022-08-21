part of 'forgotpassword_cubit.dart';

class ForgotpasswordState extends Equatable {
  const ForgotpasswordState({this.captcha = false, this.email = ''});
  final bool captcha;
  final String email;

  ForgotpasswordState copyWith({
    bool? captcha,
    String? email,
  }) {
    return ForgotpasswordState(
        captcha: captcha ?? this.captcha, email: email ?? this.email);
  }

  @override
  List<Object> get props => [captcha, email];
}
