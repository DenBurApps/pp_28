import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pp_28/helpers/image/image_helper.dart';
import 'package:pp_28/services/navigation/route_names.dart';

class CourseDetailsView extends StatelessWidget {
  CourseDetailsView({super.key});

  var value = 0.1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    Text('Course details',
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
                        /// add value from controller
                        value: value,
                        color: const Color(0xff71E9AF),
                        backgroundColor: const Color(0xffEEF0F7),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${(value * 100).toStringAsFixed(0)}%',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _CoursesCard(
                  name: 'Name',
                  onTap: () {
                    Navigator.of(context).pushNamed(RouteNames.courseLesson);
                  },
                ),
                _CoursesCard(
                  name: 'Name',
                  onTap: () {
                    Navigator.of(context).pushNamed(RouteNames.courseLesson);
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

class _CoursesCard extends StatelessWidget {
  const _CoursesCard({super.key, required this.name, required this.onTap});

  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 55,
            decoration: const BoxDecoration(
              color: Color(0xffEFEFF0),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: const BoxDecoration(
                      color: Color(0xff37736A),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ImageHelper.getSvg(SvgNames.financeIcon),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      '10 min',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.black45),
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  height: 20,
                  width: 20,
                  child: ImageHelper.getSvg(SvgNames.startIcon),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
