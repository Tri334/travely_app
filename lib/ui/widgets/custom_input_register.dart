part of '../../main.dart';

InputBorder errorStyles = OutlineInputBorder(
    borderSide: BorderSide(color: colorStyles.grey50, width: 2),
    borderRadius: BorderRadius.circular(12));
InputBorder focusedStyles = OutlineInputBorder(
    borderSide: BorderSide(color: colorStyles.black70, width: 2),
    borderRadius: BorderRadius.circular(12));

class InputUsername extends StatelessWidget {
  const InputUsername({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) => previous.userName != current.userName,
      builder: (context, state) {
        return TextField(
          onChanged: (value) =>
              context.read<RegisterCubit>().usernameChange(value),
          style:
              GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12.sp),
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(20, 0, 10, 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorStyles.grey50),
                  borderRadius: BorderRadius.circular(12)),
              focusedBorder: focusedStyles,
              hintText: 'Username'),
        );
      },
    );
  }
}

class InputPhone extends StatelessWidget {
  const InputPhone({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return TextField(
          onChanged: (value) =>
              context.read<RegisterCubit>().phoneChange(value),
          style:
              GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12.sp),
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(20, 0, 10, 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorStyles.grey50),
                  borderRadius: BorderRadius.circular(12)),
              errorBorder: errorStyles,
              focusedBorder: focusedStyles,
              hintText: 'Phone'),
        );
      },
    );
  }
}

class InputEmail extends StatelessWidget {
  const InputEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          onChanged: (value) =>
              context.read<RegisterCubit>().emailChange(value),
          style:
              GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12.sp),
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(20, 0, 10, 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorStyles.grey50),
                  borderRadius: BorderRadius.circular(12)),
              errorBorder: errorStyles,
              border: focusedStyles,
              focusedBorder: focusedStyles,
              errorText: state.email.invalid ? 'Email not valid' : null,
              hintText: 'Email'),
        );
      },
    );
  }
}

class InputPassword extends StatelessWidget {
  const InputPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) =>
          previous.password.value != current.password.value,
      builder: (context, state) {
        return TextField(
          obscureText: true,
          onChanged: (value) =>
              context.read<RegisterCubit>().passwordChange(value),
          style:
              GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12.sp),
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(20, 0, 10, 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorStyles.grey50),
                  borderRadius: BorderRadius.circular(12)),
              border: focusedStyles,
              errorBorder: errorStyles,
              focusedBorder: focusedStyles,
              errorText: state.password.invalid ? 'Minimum 8 characters' : null,
              hintText: 'Password'),
        );
      },
    );
  }
}

class InputConfirmPassword extends StatelessWidget {
  const InputConfirmPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) =>
          previous.confirmPassword != current.confirmPassword,
      builder: (context, state) {
        return TextField(
          obscureText: true,
          onChanged: (value) =>
              context.read<RegisterCubit>().confirmPassword(value),
          style:
              GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12.sp),
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(20, 0, 10, 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorStyles.grey50),
                  borderRadius: BorderRadius.circular(12)),
              errorBorder: errorStyles,
              border: focusedStyles,
              focusedBorder: focusedStyles,
              errorText:
                  state.confirmPassword.invalid ? 'Password not same' : null,
              hintText: 'Confirm Password'),
        );
      },
    );
  }
}
