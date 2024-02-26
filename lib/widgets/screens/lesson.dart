import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pp_28/services/navigation/route_names.dart';

import '../../helpers/constants.dart';
import '../../helpers/image/image_helper.dart';

class LessonView extends StatefulWidget {
  LessonView({super.key});

  @override
  State<LessonView> createState() => _LessonViewState();
}

class _LessonViewState extends State<LessonView> {
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
                        Text('Lesson',
                            style: Theme.of(context).textTheme.labelLarge),
                        const SizedBox(width: 50),
                      ],
                    ),
                    SizedBox(
                      width: 249,
                      height: 249,
                      child: ImageHelper.getImage(ImageNames.finance),
                    ),
                    Text(
                      titles[i!],
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    // const SizedBox(height: 15),
                    // Row(
                    //   children: [
                    //     SizedBox(
                    //       width: MediaQuery.of(context).size.width / 1.28,
                    //       child: LinearProgressIndicator(
                    //         /// add value from controller
                    //         value: value,
                    //         color: const Color(0xff71E9AF),
                    //         backgroundColor: const Color(0xffEEF0F7),
                    //       ),
                    //     ),
                    //     const Spacer(),
                    //     Text(
                    //       '${(value * 100).toStringAsFixed(0)}%',
                    //       style: Theme.of(context).textTheme.bodyMedium,
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 10),
                    Text(
                      texts[i],
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: Colors.black45),
                    ),
                    const SizedBox(height: 80),
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
                  Navigator.of(context).pushNamed(
                    RouteNames.finishLesson,
                    arguments: {'index': i},
                  );
                },
                child: Text(
                  'Next',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
