part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final String phone;
  final String userName;
  final bool termCondition;
  final Email email;
  final Password password;
  final ConfirmPassword confirmPassword;
  final String? errorMessage;
  final FormzStatus status;

  const RegisterState({
    this.termCondition = false,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const ConfirmPassword.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
    this.userName = '',
    this.phone = '',
  });

  RegisterState copyWith({
    UserTesting? user,
    bool? termCondition,
    Password? password,
    ConfirmPassword? confirmPassword,
    Email? email,
    FormzStatus? status,
    String? errorMessage,
    String? userName,
    String? phone,
  }) {
    return RegisterState(
      email: email ?? this.email,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      password: password ?? this.password,
      termCondition: termCondition ?? this.termCondition,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      phone: phone ?? this.phone,
      userName: userName ?? this.userName,
    );
  }

  @override
  List<Object> get props => [
        userName,
        phone,
        termCondition,
        status,
        confirmPassword,
        password,
        email,
      ];
}
