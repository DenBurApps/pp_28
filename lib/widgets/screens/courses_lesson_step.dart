import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../helpers/image/image_helper.dart';
import '../../services/navigation/route_names.dart';

class CoursesLessonStepView extends StatelessWidget {
  CoursesLessonStepView({super.key});

  var value = 0.1;
  var step = 1;
  final _lessonText =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.';

  @override
  Widget build(BuildContext context) {
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
                        Text('Step $step/10',
                            style: Theme.of(context).textTheme.labelLarge),
                        const SizedBox(width: 50),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Name',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Description',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: Colors.black45),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.28,
                          child: LinearProgressIndicator(
                            value: step / 10,
                            color: const Color(0xff71E9AF),
                            backgroundColor: const Color(0xffEEF0F7),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '${(step * 10).toStringAsFixed(0)}%',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _lessonText,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: Colors.black45),
                    ),
                    const SizedBox(height: 100),
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
              child: ElevatedButton(
                  onPressed: () {
                    /// step++
                    Navigator.of(context).pushNamed(RouteNames.finishLesson);
                  },
                  child: Text(
                    'Start',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: Colors.white),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
