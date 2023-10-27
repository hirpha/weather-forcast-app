import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/global_variable.dart';
import '../widgets/description.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  Container images(BuildContext context, String image) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * .1, left: 10, right: 10),
        alignment: Alignment.center,
        child: Image.asset(image));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff14306F),
      body: OnBoardingSlider(
          headerBackgroundColor: const Color(0xff14306F),
          pageBackgroundColor: const Color(0xff14306F),
          finishButtonTextStyle: const TextStyle(
            color: Colors.black,
            backgroundColor: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          skipIcon: const Icon(Icons.arrow_forward_ios),
          controllerColor: Colors.white,
          addButton: true,
          hasFloatingButton: true,
          addController: true,
          trailing: const Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
          trailingFunction: () {
            GoRouter.of(context).pushReplacementNamed("signin");
          },
          finishButtonText: 'Register',
          onFinish: () {
            GoRouter.of(context).pushReplacementNamed("signup");
          },
          finishButtonStyle: FinishButtonStyle(
              focusColor: const Color(0xff14306F),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xff14306F)),
          skipTextButton: const Text(
            'Skip',
            style: TextStyle(color: Colors.white),
          ),
          // trailing: Text('Login'),
          background: globalImages.map((e) => images(context, e)).toList(),
          totalPage: 3,
          speed: 1.8,
          pageBodies: onboardingTitle
              .map((e) => DescriptionWidget(
                    description: e["description"],
                    title: e['title'],
                  ))
              .toList()),
    );
  }
}
