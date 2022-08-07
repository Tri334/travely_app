part of '../../main.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool agree = false;
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 3.h),
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
              height: 35.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomInputLogin(
                      textEditingController: _usernameController,
                      hint: 'Username'),
                  CustomInputLogin(
                      textEditingController: _phoneController, hint: 'Phone'),
                  CustomInputLogin(
                      textEditingController: _emailController, hint: 'Email'),
                  CustomInputLogin(
                      textEditingController: _passwordController,
                      hint: 'Password'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 1.5.h),
              child: Row(
                children: [
                  StatefulBuilder(builder: (context, state) {
                    return Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      value: agree,
                      onChanged: (bool? value) {
                        state(() {
                          agree = value!;
                        });
                      },
                    );
                  }),
                  Row(
                    children: [
                      Text(
                        'I agree with ',
                        style: GoogleFonts.poppins(
                            color: colorStyles.black10,
                            fontWeight: FontWeight.w500,
                            fontSize: 11.sp),
                      ),
                      Text(
                        'terms',
                        style: GoogleFonts.poppins(
                            color: colorStyles.blue90,
                            fontWeight: FontWeight.w500,
                            fontSize: 11.sp),
                      ),
                      Text(
                        ' and ',
                        style: GoogleFonts.poppins(
                            color: colorStyles.black10,
                            fontWeight: FontWeight.w500,
                            fontSize: 11.sp),
                      ),
                      Text(
                        'condition.',
                        style: GoogleFonts.poppins(
                            color: colorStyles.blue90,
                            fontWeight: FontWeight.w500,
                            fontSize: 11.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const CustomButton(route: '', namaButton: 'Sign Up'),
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
                  Text(
                    'Login',
                    style: GoogleFonts.poppins(
                      decoration: TextDecoration.underline,
                      color: colorStyles.blue90,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
