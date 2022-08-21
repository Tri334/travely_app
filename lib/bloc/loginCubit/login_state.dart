part of 'login_cubit.dart';

enum LoginStatus { loginInitialized, loginSucces, loginFailure }

class LoginState extends Equatable {
  const LoginState(
      {this.email = '',
      this.verify = true,
      this.timer = 10,
      this.user,
      this.password = '',
      this.remember = false,
      this.status = LoginStatus.loginInitialized});
  final String email;
  final User? user;
  final int timer;
  final String password;
  final bool remember;
  final LoginStatus status;
  final bool verify;

  LoginState copyWith({
    bool? verify,
    LoginStatus? status,
    int? timer,
    String? email,
    User? user,
    String? password,
    bool? remember,
  }) {
    return LoginState(
        verify: verify ?? this.verify,
        timer: timer ?? this.timer,
        email: email ?? this.email,
        user: user ?? this.user,
        password: password ?? this.password,
        remember: remember ?? this.remember,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [email, password, remember, status, verify, timer];
}
