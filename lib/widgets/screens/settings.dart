import 'package:flutter/material.dart';
import 'package:pp_28/models/arguments.dart';
import 'package:pp_28/widgets/screens/agreement.dart';

import '../../helpers/email_helper.dart';
import '../../helpers/image/image_helper.dart';
import '../../services/navigation/route_names.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final TextEditingController _inputController = TextEditingController();

  void _send() => EmailHelper.launchEmailSubmission(
        toEmail: 'huansui@sontfinances.site',
        subject: _inputController.text,
        errorCallback: () {},
        doneCallback: () => setState(() {
          _inputController.clear();
        }),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: ListView(
              children: [
                const SizedBox(height: 10),
                Center(
                    child: Text('Settings',
                        style: Theme.of(context).textTheme.displaySmall)),
                const SizedBox(height: 50),
                _SettingsCard(
                  icon: SvgNames.privacyIcon,
                  text: 'Privacy Policy',
                  onTap: () => Navigator.of(context).pushNamed(
                    RouteNames.agreement,
                    arguments: AgreementViewArguments(
                      agreementType: AgreementType.privacy,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _SettingsCard(
                  icon: SvgNames.termsIcon,
                  text: 'Terms of use',
                  onTap: () => Navigator.of(context).pushNamed(
                    RouteNames.agreement,
                    arguments: AgreementViewArguments(
                      agreementType: AgreementType.terms,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _SettingsCard(
                  icon: SvgNames.contactDevIcon,
                  text: 'Contact Developer',
                  onTap: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30.0)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: SizedBox(
                            height: 300,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      const SizedBox(width: 30),
                                      const Spacer(),
                                      const Text('Contact Developer'),
                                      const Spacer(),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          icon: const Icon(Icons.close_rounded))
                                    ],
                                  ),
                                  const Spacer(),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      'Write anything you want to tell us about',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextField(
                                    controller: _inputController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black54, width: 1.0),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black12, width: 1),
                                      ),
                                      hintText: 'Send your message',
                                    ),
                                  ),
                                  const Spacer(),
                                  ValueListenableBuilder<TextEditingValue>(
                                      valueListenable: _inputController,
                                      builder: (context, value, child) {
                                        return ElevatedButton(
                                          onPressed:
                                              (_inputController.text.isNotEmpty)
                                                  ? _send
                                                  : null,
                                          child: Text('Send',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                      color: Colors.white)),
                                        );
                                      }),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard(
      {super.key, required this.icon, required this.text, required this.onTap});

  final String icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 54,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffF2F2F2)),
            borderRadius: const BorderRadius.all(Radius.circular(15.0))),
        child: Row(
          children: [
            const SizedBox(width: 20),
            ImageHelper.getSvg(icon),
            const SizedBox(width: 10),
            Text(text, style: Theme.of(context).textTheme.displaySmall),
            const Spacer(),
            const Icon(
              Icons.chevron_right_rounded,
              color: Color(0xff828282),
            ),
            const SizedBox(width: 15),
          ],
        ),
      ),
    );
  }
}
