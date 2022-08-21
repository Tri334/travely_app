part of '../../main.dart';

class InputLoginUsername extends StatelessWidget {
  const InputLoginUsername({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextField(
          onChanged: (value) => context.read<LoginCubit>().loginEmail(value),
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
              hintText: 'Email'),
        );
      },
    );
  }
}

class InputLoginPassword extends StatelessWidget {
  const InputLoginPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextField(
          onChanged: (value) => context.read<LoginCubit>().loginPassword(value),
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
              hintText: 'Email'),
        );
      },
    );
  }
}
