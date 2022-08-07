part of '../../main.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool remember = false;
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            const TopImage(),
            Positioned(
              top: 32.h,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 2.h),
                          child: Text(
                            'Login',
                            style: GoogleFonts.poppins(
                                color: colorStyles.black50,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Column(
                          children: [
                            CustomInputLogin(
                                textEditingController: _usernameController,
                                hint: 'Username'),
                            SizedBox(
                              height: 2.h,
                            ),
                            CustomInputLogin(
                                textEditingController: _passwordController,
                                hint: 'Password'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    StatefulBuilder(builder: (context, state) {
                                      return Checkbox(
                                        checkColor: Colors.white,
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                                getColor),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                        value: remember,
                                        onChanged: (bool? value) {
                                          state(() {
                                            remember = value!;
                                          });
                                        },
                                      );
                                    }),
                                    Text(
                                      'Remember me',
                                      style: GoogleFonts.poppins(
                                          color: colorStyles.black10,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11.sp),
                                    )
                                  ],
                                ),
                                Text(
                                  'Forgot Password?',
                                  style: GoogleFonts.poppins(
                                      color: colorStyles.black50,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            )
                          ],
                        ),
                        const CustomButton(
                            route: 'sign_up', namaButton: 'Login'),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account?',
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
                                'Sign up',
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 25.w,
                              height: 1,
                              color: const Color(0xffE7E7E7),
                            ),
                            Text(
                              'or sign in with',
                              style: GoogleFonts.poppins(
                                color: colorStyles.black10,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Container(
                              width: 25.w,
                              height: 1,
                              color: const Color(0xffE7E7E7),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 15.w,
                                height: 15.h,
                                child: Image(
                                    image: AssetImage(signInWith.google))),
                            SizedBox(
                              width: 3.5.w,
                            ),
                            SizedBox(
                                width: 15.w,
                                height: 15.h,
                                child: Image(
                                    image: AssetImage(signInWith.facebook)))
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TopImage extends StatelessWidget {
  const TopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(loginImage.img), fit: BoxFit.cover),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(165),
              bottomRight: Radius.circular(165)),
          color: Colors.transparent),
      height: 30.h,
      width: 100.w,
      child: Stack(children: [
        Positioned(
            bottom: 12,
            right: 1,
            left: 1,
            child: Text(
              'Travely',
              textAlign: TextAlign.center,
              style: GoogleFonts.comfortaa(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.sp,
                  color: Colors.white),
            ))
      ]),
    );
  }
}
