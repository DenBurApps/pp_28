import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:pp_28/helpers/email_helper.dart';
import 'package:pp_28/helpers/text_helper.dart';
import 'package:pp_28/models/arguments.dart';
import 'package:pp_28/services/navigation/route_names.dart';

class AgreementView extends StatefulWidget {
  final AgreementViewArguments arguments;
  const AgreementView({super.key, required this.arguments});

  factory AgreementView.create(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as AgreementViewArguments;
    return AgreementView(arguments: arguments);
  }

  @override
  State<AgreementView> createState() => _AgreementViewState();
}

class _AgreementViewState extends State<AgreementView> {
  AgreementType get _agreementType => widget.arguments.agreementType;

  bool get _usePrivacyAgreement => widget.arguments.usePrivacyAgreement;

  String get _agreementText => _agreementType == AgreementType.privacy
      ? TextHelper.privacy
      : TextHelper.terms;

  String get _title => _agreementType == AgreementType.privacy
      ? 'Privacy Policy'
      : 'Terms Of Use';

  void _accept() {
    Navigator.of(context).pushReplacementNamed(RouteNames.homeMenu);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_usePrivacyAgreement)
                    Text(
                      _title,
                      style: Theme.of(context).textTheme.displayLarge,
                    )
                  else
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: Navigator.of(context).pop,
                        ),
                        Text(
                          _title,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(bottom: 70),
                        physics: const BouncingScrollPhysics(),
                        child: MarkdownBody(
                          styleSheet: MarkdownStyleSheet(
                            h1: Theme.of(context).textTheme.displayMedium,
                            h2: Theme.of(context).textTheme.headlineMedium,
                            h3: Theme.of(context).textTheme.displaySmall,
                            h4: Theme.of(context).textTheme.headlineSmall,
                          ),
                          data: _agreementText,
                          onTapLink: (text, href, title) =>
                              EmailHelper.launchEmailSubmission(
                            toEmail: text,
                            subject: '',
                            body: '',
                            errorCallback: () {},
                            doneCallback: () {},
                          ),
                          selectable: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (_usePrivacyAgreement)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 60,
                    child: _AgreementButton(
                      onPressed: _accept,
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class _AgreementButton extends StatelessWidget {
  final VoidCallback onPressed;
  const _AgreementButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          'Agree',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}

enum AgreementType {
  privacy,
  terms,
}
