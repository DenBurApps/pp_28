import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pp_28/services/navigation/route_names.dart';

import '../../helpers/constants.dart';
import '../../helpers/image/image_helper.dart';
import '../../storage/storage_service.dart';

class CoursesView extends StatefulWidget {
  CoursesView({super.key});

  @override
  State<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {
  final _storageService = GetIt.instance<StorageService>();
  late final _completedLessons;

  @override
  void initState() {
    final storageService = GetIt.instance<StorageService>();
    _completedLessons =
        (_storageService.getStringList(StorageKeys.completedLessons) ??
                <String>[])
            .toSet();
    super.initState();
  }

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
                Center(
                  child: Text('Courses',
                      style: Theme.of(context).textTheme.labelLarge),
                ),
                const SizedBox(height: 20),
                for (int i = 0; i < titles.length; i++)
                  _CourseCard(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        RouteNames.courseLesson,
                        arguments: {'index': i},
                      );
                    },
                    name: titles[i],
                    isCompleted: _completedLessons.contains(i.toString()),
                  ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  const _CourseCard(
      {super.key,
      required this.onTap,
      required this.name,
      required this.isCompleted});

  final VoidCallback onTap;
  final String name;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 179,
          decoration: BoxDecoration(
            color: (isCompleted)
                ? const Color(0xff37736A)
                : const Color(0xff1C1C1C),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    ImageHelper.getSvg(SvgNames.followIcon),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: LinearProgressIndicator(
                        value: (isCompleted) ? 1 : 0,
                        color: const Color(0xff71E9AF),
                      ),
                    ),
                    const SizedBox(width: 5),
                    (isCompleted)
                        ? Text(
                            '100%',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white),
                          )
                        : Text(
                            '0%',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white),
                          ),
                  ],
                ),
                const Divider(
                  color: Colors.white,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    ImageHelper.getSvg(SvgNames.clockIcon),
                    const SizedBox(width: 10),
                    Text(
                      '10 minutes',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(width: 40),
                    ImageHelper.getSvg(SvgNames.bookIcon),
                    const SizedBox(width: 10),
                    Text(
                      '5 questions',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
