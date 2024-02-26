import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../helpers/image/image_helper.dart';
import '../../../services/navigation/route_names.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  var _currentStep = 0;

  final _images = [
    ImageHelper.getImage(ImageNames.onboarding_1).image,
    ImageHelper.getImage(ImageNames.onboarding_2).image,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: InkWell(
        onTap: () {
          setState(() {
            if (_currentStep == 1) {
              Navigator.of(context).pushNamed(RouteNames.homeMenu);
              return;
            }
            _currentStep++;
          });
        },
        child: (_currentStep == 0)
            ? Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: _images[_currentStep],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 1.9,
                        left: 50,
                        right: 50),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            'Improve your\nwallet!',
                            style: Theme.of(context).textTheme.displayLarge,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Boost Your Financial Well-being!',
                            style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.center,
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 85,
                            height: 85,
                            child: ImageHelper.getImage(ImageNames.nextIcon),
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  )
                ],
              )
            : Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: _images[_currentStep],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 60, left: 30, right: 50),
                        child: Text(
                          'Your personal financial assistant in your pocket!',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: 85,
                        height: 85,
                        child: ImageHelper.getImage(ImageNames.nextIcon),
                      ),
                    ],
                  )
                ],
              ),
      ),
    );
  }
}
