part of '../../main.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: colorStyles.black70,
                ))),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.5.h),
                  child: Text(
                    'Sign up',
                    style: GoogleFonts.poppins(
                        color: colorStyles.black50,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                width: 80.w,
                height: 45.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(
                      child: InputUsername(),
                    ),
                    Expanded(
                      child: InputPhone(),
                    ),
                    Expanded(
                      child: InputEmail(),
                    ),
                    Expanded(
                      child: InputPassword(),
                    ),
                    Expanded(
                      child: InputConfirmPassword(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 1.5.h),
                child: Row(
                  children: [
                    BlocBuilder<RegisterCubit, RegisterState>(
                      buildWhen: (previous, current) =>
                          previous.termCondition != current.termCondition,
                      builder: (context, state) {
                        return Checkbox(
                          checkColor: Colors.white,
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3)),
                          value: state.termCondition,
                          onChanged: (bool? value) {
                            context.read<RegisterCubit>().checkTermCondition();
                          },
                        );
                      },
                    ),
                    Row(
                      children: [
                        Text(
                          'I agree with ',
                          style: GoogleFonts.poppins(
                              color: colorStyles.black10,
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp),
                        ),
                        Text(
                          'terms',
                          style: GoogleFonts.poppins(
                              color: colorStyles.blueLink,
                              fontWeight: FontWeight.w500,
                              fontSize: 11.sp),
                        ),
                        Text(
                          ' and ',
                          style: GoogleFonts.poppins(
                              color: colorStyles.black10,
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp),
                        ),
                        Text(
                          'condition.',
                          style: GoogleFonts.poppins(
                              color: colorStyles.blueLink,
                              fontWeight: FontWeight.w500,
                              fontSize: 11.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
                  // log('Refrehs');
                  // log(state.termCondition.toString());
                  // log(state.password.invalid.toString());
                  // log(state.confirmPassword.invalid.toString());
                  // log("Email:" + state.email.value.length.toString());
                  bool enable = false;
                  if (state.email.invalid == true ||
                      state.termCondition == false ||
                      state.password.invalid == true ||
                      state.confirmPassword.invalid == true ||
                      state.userName.length < 2 ||
                      state.phone.length < 2) {
                    enable = false;
                  } else {
                    enable = true;
                  }
                  return GestureDetector(
                      onTap: () {
                        context
                            .read<RegisterCubit>()
                            .signUpEmailAndPassword()
                            .then((value) {
                          context.goNamed('verify', extra: state.user);
                        });
                      },
                      child:
                          CustomButton(namaButton: 'Sign Up', enable: enable));
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'already have an account ?',
                      style: GoogleFonts.poppins(
                        color: colorStyles.black10,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.goNamed('login');
                      },
                      child: Text(
                        'Login',
                        style: GoogleFonts.poppins(
                          decoration: TextDecoration.underline,
                          color: colorStyles.blueLink,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
