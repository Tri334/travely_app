import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travely_app/bloc/landing_hint_bloc.dart';
import 'package:travely_app/models/color_model.dart';
import 'package:travely_app/models/landing_model.dart';

class TutorialPage extends StatelessWidget {
  TutorialPage({Key? key}) : super(key: key);
  static String routeName = 'landing';

  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Container(
                color: Colors.green,
                child: PageView.builder(
                    allowImplicitScrolling: false,
                    controller: _pageController,
                    itemCount: landingContent.length,
                    onPageChanged: (value) => context
                        .read<LandingHintBloc>()
                        .add(EventPageChange(value)),
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 15.h, bottom: 5.h),
                            child: Container(
                                color: Colors.transparent,
                                height: 25.h,
                                width: 80.w,
                                child: Image.asset(
                                  landingContent[index].img,
                                  fit: BoxFit.contain,
                                )),
                          ),
                          Expanded(
                            child: Container(
                              width: 80.w,
                              color: Colors.transparent,
                              child: Text(
                                landingContent[index].textContent,
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.comfortaa(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w400,
                                    color: colorStyles.black10),
                              ),
                            ),
                          ),
                        ],
                      );
                    })),
          ),
          Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: colorStyles.blue40,
                    radius: 25,
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: landingContent.length,
                    effect: ExpandingDotsEffect(
                        radius: 14,
                        dotHeight: 1.2.h,
                        dotWidth: 3.2.w,
                        activeDotColor: colorStyles.blue40,
                        dotColor: colorStyles.grey50,
                        spacing: 12),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlocBuilder<LandingHintBloc, String>(
                        builder: (context, state) {
                          return Text(
                            state,
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.poppins(
                                color: colorStyles.black90,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400),
                          );
                        },
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 10.sp,
                        color: colorStyles.black90,
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
