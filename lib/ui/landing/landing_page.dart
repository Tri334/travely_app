import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:travely_app/models/color_model.dart';
import 'package:travely_app/ui/landing/tutorial_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  static String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/imgs/landing_image.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black87.withOpacity(0.3),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: BackdropFilter(
                blendMode: BlendMode.multiply,
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5)),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(decorImg.img1), fit: BoxFit.cover)),
              height: 30.h,
              width: 100.w,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(decorImg.img2), fit: BoxFit.cover)),
              height: 26.h,
              width: 100.w,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(decorImg.img3), fit: BoxFit.cover)),
              height: 19.5.h,
              width: 100.w,
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            top: 20.h,
            bottom: 20.h,
            child: Column(
              children: [
                Image(image: AssetImage(decorImg.map)),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Travely',
                  style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 40.sp),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  'Discover the beauty of the world',
                  style: GoogleFonts.comfortaa(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: InkWell(
              onTap: () => GoRouter.of(context).go(TutorialPage.routeName),
              child: Container(
                height: 7.h,
                width: 80.w,
                decoration: BoxDecoration(
                    color: colorStyles.blue40,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Text(
                    'Let\'s go',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18.sp),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
