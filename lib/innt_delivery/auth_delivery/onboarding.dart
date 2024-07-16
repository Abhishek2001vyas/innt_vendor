import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../Controllers/constant.dart';
import 'email_login.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  late Material materialButton;

  // late int index;
  void _onIntroEnd(context) {
    print(introKey);
  }

  Widget _buildFullscreenImage() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
      child: Image.asset(
        'assets/images/img_1.png',
        scale: 0.5,
        alignment: Alignment.center,
      ),
    );
  }

  //
  // Widget _buildImage(String assetName, [double width = 50]) {
  //   return Image.asset('assets/images/IMG-20231123-WA0001.jpg', width: width);
  // }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    const bodyStyle = TextStyle(
          color: Color(0xff0c1037),
          fontSize: 18,
        ),
        pageDecoration = PageDecoration(
          titleTextStyle:
              TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
          bodyTextStyle: bodyStyle,
          bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
          pageColor: Colors.white,
          imagePadding: EdgeInsets.zero,
        );

    return IntroductionScreen(
      resizeToAvoidBottomInset: true,
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 2000,
      infiniteAutoScroll: true,
      globalHeader: const Align(
        alignment: Alignment.topRight,
        /* child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: _buildImage('assets/images/IMG-20231123-WA0002.jpg', 100),
          ),
        ),*/
      ),
      pages: [
        PageViewModel(
          useScrollView: false,
          title: "",
          bodyWidget: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/img_1.png',
                  fit: BoxFit.cover,
                  height: h / 1.8,
                ),
                Text(
                  "Empowering the World \nof Beauty by Education",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: w / 25,
                    overflow: TextOverflow.ellipsis,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                )
              ],
            ),
          ),
          // body: "Empowering the World \nof Beauty by Education",
          // image: _buildFullscreenImage(),
          // decoration: pageDecoration,
        ),
        PageViewModel(
          useScrollView: false,
          title: "",
          bodyWidget: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/img_1.png',
                  fit: BoxFit.cover,
                  height: h / 1.8,
                ),
                Text(
                  "Hair Style Make up Hair Design \nStream Full Session with Description",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: w / 25,
                    overflow: TextOverflow.ellipsis,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                )
              ],
            ),
          ),
          // body:
          //     "Hair Style Make up Hair Design \nStream Full Session with Description",
          // image: Image.asset('assets/images/IMG-20231123-WA0001.jpg'),
          //decoration: pageDecoration,
        ),
        PageViewModel(
          useScrollView: false,
          title: "",
          bodyWidget: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/img_1.png',
                  fit: BoxFit.cover,
                  height: h / 1.8,
                ),
                Text(
                  "Anytime Anywhere \nGain Knowledge with Practice",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: w / 25,
                    overflow: TextOverflow.ellipsis,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                )
              ],
            ),
          ),
          // body: "",
          // image: Image.asset('assets/images/IMG-20231123-WA0002.jpg'),
          // decoration: pageDecoration,
        ),
        PageViewModel(
          useScrollView: false,
          title: "",
          bodyWidget: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/img_1.png',
                  fit: BoxFit.cover,
                  height: h / 1.8,
                ),
                Text(
                  "Happy Hair Stand for latest Design \n And Creation Across the Worlde",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: w / 25,
                    overflow: TextOverflow.ellipsis,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                )
              ],
            ),
          ),
          // body:
          //     "Happy Hair Stand for latest Design \n And Creation Across the World",
          // image: Image.asset('assets/images/IMG-20231123-WA0003.jpg'),
          // decoration: pageDecoration,
        ),
        PageViewModel(
          useScrollView: false,
          title: "",
          bodyWidget: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/img_1.png',
                  fit: BoxFit.cover,
                  height: h / 1.8,
                ),
                Text(
                  "Access Unlimited Video \n as per Your Choice",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: w / 25,
                    overflow: TextOverflow.ellipsis,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                )
              ],
            ),
          ),
          // body: "Access Unlimited Video as per Your Choice",
          // image: Image.asset('assets/images/IMG-20231123-WA0004.jpg'),
          // decoration: pageDecoration,
        ),
        /*   PageViewModel(
          title: "",
          body: 'Access Unlimited Video as per Your Choice',

          decoration: pageDecoration,
          // decoration: pageDecoration.copyWith(
          //   contentMargin: const EdgeInsets.symmetric(horizontal: 16),
          //   fullScreen: true,
          //   bodyFlex: 2,
          //   imageFlex: 3,
          //   safeArea: 100,
          // ),
        ),*/
        /*  PageViewModel(
          title: "Another title page",
          body: "Another beautiful body text for this example onboarding",
          image: _buildImage('assets/images/IMG-20231123-WA0002.jpg'),
          footer: ElevatedButton(
            onPressed: () {
              introKey.currentState?.animateScroll(0);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              'FooButton',
              style: TextStyle(color: Colors.white),
            ),
          ),
          decoration: pageDecoration.copyWith(
            bodyFlex: 6,
            imageFlex: 6,
            safeArea: 80,
          ),
        ),
        PageViewModel(
          title: "Title of last page - reversed",
          bodyWidget: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Click on ", style: bodyStyle),
              Icon(Icons.edit),
              Text(" to edit a post", style: bodyStyle),
            ],
          ),
          decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.topCenter,
          ),
          image: _buildImage('assets/images/IMG-20231123-WA0002.jpg'),
          reverse: true,
        ),*/
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => EmailLoginDelivery())),
      // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(
        Icons.arrow_back,
        color: logocolo,
      ),
      skip: Text('Skip',
          style: TextStyle(
              color: logocolo, fontWeight: FontWeight.bold, fontSize: w / 25)),
      next: Text(
        "Next",
        style: TextStyle(
            color: logocolo, fontWeight: FontWeight.bold, fontSize: w / 25),
      ),
      // const Icon(
      //   Icons.arrow_forward,
      //   color: logocolo,
      // ),
      done: TextButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EmailLoginDelivery()));
        },
        child: Text(
          'Get Started',
          style: TextStyle(
              color: logocolo, fontWeight: FontWeight.bold, fontSize: w / 25),
        ),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(12),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        activeColor: logocolo,
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
