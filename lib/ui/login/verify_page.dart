part of '../../main.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({Key? key, required this.user}) : super(key: key);

  final User? user;
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
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 3.h),
              child: Text(
                'Email Verification',
                style: GoogleFonts.poppins(
                    color: colorStyles.black50,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                children: [
                  Text(
                    'To ensure your experience we need to verify your email',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: colorStyles.black10,
                        fontWeight: FontWeight.w400,
                        fontSize: 11.sp),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  BlocBuilder<LoginCubit, LoginState>(
                    buildWhen: (previous, current) =>
                        previous.timer != current.timer ||
                        previous.verify != current.verify,
                    builder: (context, state) {
                      if (state.verify == false) {
                        Future.delayed(const Duration(seconds: 1)).then(
                            (value) =>
                                context.read<LoginCubit>().onEventDecrement());
                      }
                      return state.verify == false
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'didn\'t get the email? Try in ${state.timer} sec',
                                  style: GoogleFonts.poppins(
                                      color: colorStyles.black10,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11.sp),
                                ),
                              ],
                            )
                          : Container();
                    },
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.5.h),
              child: BlocBuilder<LoginCubit, LoginState>(
                buildWhen: (previous, current) =>
                    previous.verify != current.verify,
                builder: (context, state) {
                  return GestureDetector(
                      onTap: () {
                        if (state.verify) {
                          try {
                            user!.sendEmailVerification();
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  content: Text('Please check your email'),
                                );
                              },
                            );
                            context.read<LoginCubit>().onEventDecrement();
                          } catch (e) {
                            print(e.toString());
                          }
                        }
                      },
                      child: CustomButton(
                        namaButton: 'Verify',
                        enable: state.verify,
                      ));
                },
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    context.goNamed('login');
                    FirebaseAuth.instance.signOut();
                  },
                  child: CustomButton(
                    namaButton: 'Login',
                    enable: state.verify,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
