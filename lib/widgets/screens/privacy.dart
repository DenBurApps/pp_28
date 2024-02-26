import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivacyView extends StatelessWidget {
  const PrivacyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: SafeArea(
          child: ListView(
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.chevron_left_rounded)),
                  const Spacer(),
                  Text('Privacy',
                      style: Theme.of(context).textTheme.displaySmall),
                  const Spacer(),
                  const SizedBox(height: 10, width: 40),
                ],
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text('privacyTermsText'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
