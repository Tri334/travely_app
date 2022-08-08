part of '../../main.dart';

class OtpVerification extends StatelessWidget {
  OtpVerification({Key? key}) : super(key: key);
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();
  final TextEditingController _thirdController = TextEditingController();
  final TextEditingController _fourController = TextEditingController();

  final OtpVerificationBloc _resendCode = OtpVerificationBloc()
    ..add(const EventOtpInit(0));
  final OtpVerificationBloc _resendCodeViaEmail = OtpVerificationBloc()
    ..add(const EventOtpInit(0));

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
                'OTP Verification',
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
                    'a 4 digit code is sent to your phone number',
                    style: GoogleFonts.poppins(
                        color: colorStyles.black10,
                        fontWeight: FontWeight.w400,
                        fontSize: 11.sp),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 3.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OtpInput(controller: _firstController, focus: false),
                        OtpInput(controller: _secondController, focus: false),
                        OtpInput(controller: _thirdController, focus: false),
                        OtpInput(controller: _fourController, focus: false),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'didn\'t get the code?',
                        style: GoogleFonts.poppins(
                            color: colorStyles.black10,
                            fontWeight: FontWeight.w400,
                            fontSize: 11.sp),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      BlocBuilder<OtpVerificationBloc, OtpVerificationState>(
                        bloc: _resendCode,
                        builder: (context, state) {
                          if (state.counter > 0) {
                            Future.delayed(const Duration(seconds: 1)).then(
                                (value) => _resendCode
                                    .add(EventOtpDecrement(state.counter)));
                            return Text(
                              '${state.counter} sec',
                              style: GoogleFonts.poppins(
                                  color: colorStyles.black10,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11.sp),
                            );
                          } else {
                            return GestureDetector(
                                onTap: () {
                                  _resendCode
                                      .add(EventGetNewCode(state.counter));
                                },
                                child: Text(
                                  'resend code',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      color: colorStyles.blueLink,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11.sp),
                                ));
                          }
                        },
                      ),
                    ],
                  ),
                  BlocBuilder<OtpVerificationBloc, OtpVerificationState>(
                    bloc: _resendCodeViaEmail,
                    builder: (context, state) {
                      if (state.counter > 0) {
                        Future.delayed(const Duration(seconds: 1)).then(
                            (value) => _resendCodeViaEmail
                                .add(EventOtpDecrement(state.counter)));
                        return Text(
                          'you can resend code in ${state.counter} sec',
                          style: GoogleFonts.poppins(
                              color: colorStyles.black10,
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp),
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {
                            _resendCodeViaEmail
                                .add(EventGetNewCodeEmail(state.counter));
                          },
                          child: Text(
                            'Get the code via email',
                            style: GoogleFonts.poppins(
                                decoration: TextDecoration.underline,
                                color: colorStyles.blueLink,
                                fontWeight: FontWeight.w500,
                                fontSize: 11.sp),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.5.h),
              child: const CustomButton(route: 'home', namaButton: 'Verify'),
            )
          ],
        ),
      ),
    );
  }
}

class OtpInput extends StatelessWidget {
  const OtpInput({
    Key? key,
    required TextEditingController controller,
    required this.focus,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final bool focus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.sp,
      width: 50.sp,
      child: TextField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else {
            FocusScope.of(context).previousFocus();
          }
        },
        controller: _controller,
        autofocus: focus,
        textAlign: TextAlign.center,
        style: GoogleFonts.oxygen(
            decoration: TextDecoration.underline,
            color: colorStyles.black50,
            fontWeight: FontWeight.w400,
            fontSize: 15.sp),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counter: const Offstage(),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colorStyles.grey50)),
        ),
      ),
    );
  }
}
