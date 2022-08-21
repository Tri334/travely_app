part of '../../main.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);
  final ForgotpasswordCubit _forgotpasswordCubit = ForgotpasswordCubit();
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Center(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 3.h),
              child: Text(
                'Forgot Password?',
                style: GoogleFonts.poppins(
                    color: colorStyles.black50,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 3.h, top: 1.h),
              child: Text(
                'No worries, we\'ll send you reset instructions',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: colorStyles.black10,
                    fontWeight: FontWeight.w400,
                    fontSize: 11.sp),
              ),
            ),
            TextField(
              obscureText: false,
              onChanged: (value) => _forgotpasswordCubit.onEmailChange(value),
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400, fontSize: 12.sp),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(20, 0, 10, 10),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorStyles.grey50),
                      borderRadius: BorderRadius.circular(12)),
                  errorBorder: errorStyles,
                  border: focusedStyles,
                  focusedBorder: focusedStyles,
                  hintText: 'Email'),
            ),
            Row(
              children: [
                BlocBuilder<ForgotpasswordCubit, ForgotpasswordState>(
                  bloc: _forgotpasswordCubit,
                  builder: (context, state) {
                    return Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      value: state.captcha,
                      onChanged: (bool? value) {
                        _forgotpasswordCubit.onChaptcha();
                      },
                    );
                  },
                ),
                Text(
                  'Captcha',
                  style: GoogleFonts.poppins(
                      color: colorStyles.black10,
                      fontWeight: FontWeight.w400,
                      fontSize: 11.sp),
                )
              ],
            ),
            BlocBuilder<ForgotpasswordCubit, ForgotpasswordState>(
              bloc: _forgotpasswordCubit,
              builder: (context, state) {
                var enable = false;
                if (state.email.isNotEmpty && state.captcha == true) {
                  enable = true;
                } else {
                  enable = false;
                }
                return GestureDetector(
                    onTap: () async {
                      try {
                        await FirebaseAuth.instance
                            .sendPasswordResetEmail(email: state.email)
                            .then((value) => showDialog(
                                  context: context,
                                  builder: (context) => const AlertDialog(
                                      content: Text('Please Check Your Email')),
                                ))
                            .then((value) => context.goNamed('login'));
                        _forgotpasswordCubit.onEmailChange('');
                      } on FirebaseAuthException catch (_) {
                        showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                                content: Text('Email Not Valid')));
                      }
                    },
                    child: CustomButton(
                      namaButton: 'Reset Password',
                      enable: enable,
                    ));
              },
            )
          ],
        )),
      ),
    );
  }
}
