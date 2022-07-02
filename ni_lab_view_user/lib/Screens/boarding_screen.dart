import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ni_lab_view_user/app_theme.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController? _pageController;

  // changeIntroPath() async {
  //   await SetSharedPreferencesForIntroScreens().chaangeIntroRoute(true);
  // }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    //  changeIntroPath();
  }

  @override
  void dispose() {
    super.dispose();

    _pageController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 60),
        child: PageView(
          controller: _pageController,
          physics: const BouncingScrollPhysics(),
          children: [
            builContainerForEachPage(
              img: '1',
              title: 'Transforming Vision into technology',
              body:
                  '"Technology like art is a soaring exercise of the human imagniation."',
            ),
            builContainerForEachPage(
              img: '2',
              title: 'Transforming Vision into technology',
              body:
                  '"Innovation is the outcome of a habbit, not a random act."',
            ),
            builContainerForEachPage(
              img: '3',
              title: 'Transforming Vision into technology',
              body:
                  '"The technology you use impresses no one. The experience you create with it is everything."',
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                _pageController!.jumpToPage(2);
              },
              child: const Text('SKIP'),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: _pageController!,
                onDotClicked: (index) => _pageController!.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn),
                count: 3,
                textDirection: TextDirection.ltr,
                effect:
                    const WormEffect(spacing: 16, dotHeight: 10, dotWidth: 10),
              ),
            ),
            TextButton(
              onPressed: () {
                _pageController!.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );

                if (_pageController!.page == 2.0) {
                  Navigator.of(context).pushNamed('/initializingScreen');
                }
              },
              child: const Text('NEXT'),
            ),
          ],
        ),
      ),
    );
  }

  Container builContainerForEachPage(
      {String? img, String? title, String? body}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'Asssets/IntroImages/$img.png',
              width: MediaQuery.of(context).size.width -
                  MediaQuery.of(context).padding.left,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              title!,
              textAlign: TextAlign.center,
              style:
                  AppTheme.kHeadingStyleForAboutSection.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              body!,
              textAlign: TextAlign.center,
              style: AppTheme.kHeadingContentStyleForAboutSection
                  .copyWith(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
