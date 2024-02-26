import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../helpers/image/image_helper.dart';
import '../../services/navigation/route_names.dart';

class FinishLessonView extends StatefulWidget {
  FinishLessonView({super.key});

  @override
  State<FinishLessonView> createState() => _FinishLessonViewState();
}

class _FinishLessonViewState extends State<FinishLessonView> {
  @override
  Widget build(BuildContext context) {
    final index =
    ModalRoute.of(context)!.settings.arguments as Map<String, int>;
    final i = index['index'];
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Theme.of(context).colorScheme.background,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ListView(
                  children: [
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: ImageHelper.getSvg(SvgNames.backIcon),
                        ),
                        Text('Step 1/2',
                            style: Theme.of(context).textTheme.labelLarge),
                        const SizedBox(width: 50),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 12),
                    SizedBox(
                      width: 211,
                      height: 285,
                      child: ImageHelper.getImage(ImageNames.finish),
                    ),
                    Center(
                      child: Text(
                        'Congratz!',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Center(
                        child: Text(
                      'You have successfully passed the theoretical part! Would you like to be tested on the material you have learned?',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Color(0xff1C1B1B)),
                    ))
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 20,
                left: MediaQuery.of(context).size.width / 3.2,
                right: MediaQuery.of(context).size.width / 3.2,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        RouteNames.quiz,
                        arguments: {'index': i},
                      );
                    },
                    child: Text(
                      'Start',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      /// send event to nav to courses
                      Navigator.of(context).pushNamed(RouteNames.homeMenu);
                    },
                    child: Text('Not now',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.black45)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
