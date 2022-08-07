part of '../../main.dart';

class TutorialPage extends StatelessWidget {
  TutorialPage({Key? key}) : super(key: key);

  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Container(
                color: Colors.transparent,
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
                  BlocBuilder<LandingHintBloc, String>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          if (state.toLowerCase() != 'done') {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                          } else {
                            context.goNamed('login');
                          }
                        },
                        child: CircleAvatar(
                          backgroundColor: colorStyles.blue40,
                          radius: 25,
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 20.sp,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
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
                  GestureDetector(
                    onTap: () => context.goNamed('login'),
                    child: Row(
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
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
