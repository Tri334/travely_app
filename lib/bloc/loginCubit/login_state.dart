part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState(
      {this.email = '', this.password = '', this.remember = false});
  final String email;
  final String password;
  final bool remember;

  LoginState copyWith({
    String? email,
    String? password,
    bool? remember,
  }) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        remember: remember ?? this.remember);
  }

  @override
  List<Object> get props => [email, password, remember];
}
