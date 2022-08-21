import 'package:formz/formz.dart';

enum PasswordValidationError { invalid }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');

  const Password.dirty([super.value = '']) : super.dirty();

  static final RegExp _passwordRegex = RegExp(
      // Minimum eight characters, at least one letter and one number:
      // r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$",
      // Minimum eight characters,
      r"[0-9|a-z|A-Z]{8,}");

  @override
  PasswordValidationError? validator(String? value) {
    return _passwordRegex.hasMatch(value ?? '')
        ? null
        : PasswordValidationError.invalid;
  }
}
