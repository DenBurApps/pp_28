import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pp_28/helpers/dialog_helper.dart';
import 'package:pp_28/models/arguments.dart';
import 'package:pp_28/storage/storage_service.dart';
import 'package:pp_28/widgets/screens/agreement.dart';
import '../../../helpers/image/image_helper.dart';
import '../../../services/navigation/route_names.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final _storageService = GetIt.instance<StorageService>();
  var _currentStep = 0;

  final _images = [
    ImageHelper.getImage(ImageNames.onboarding_1).image,
    ImageHelper.getImage(ImageNames.onboarding_2).image,
  ];

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() {
    _storageService.setBool(StorageKeys.seenOnboarding, true);
  }

  void _progress() {
    if (_currentStep == 1) {
      _storageService.setBool(StorageKeys.seenPrivacyAgreement, true);
      DialogHelper.showPrivacyAgreementDialog(
        context,
        yes: () => Navigator.of(context).pushReplacementNamed(
          RouteNames.agreement,
          arguments: AgreementViewArguments(
            agreementType: AgreementType.privacy,
            usePrivacyAgreement: true,
          ),
        ),
        no: () => Navigator.of(context).pushReplacementNamed(
          RouteNames.homeMenu,
        ),
      );
    } else {
      setState(() => _currentStep++);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: InkWell(
        onTap: _progress,
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
                        padding:
                            const EdgeInsets.only(top: 60, left: 30, right: 50),
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
