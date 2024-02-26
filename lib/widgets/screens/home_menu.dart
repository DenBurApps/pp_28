import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pp_28/widgets/screens/courses.dart';
import 'package:pp_28/widgets/screens/my_wallet.dart';
import '/widgets/screens/balance.dart';
import '/widgets/screens/settings.dart';
import '../../helpers/image/image_helper.dart';
import '../../services/event_bus.dart';

class HomeMenuView extends StatefulWidget {
  const HomeMenuView({Key? key}) : super(key: key);

  @override
  State<HomeMenuView> createState() => _HomeMenuViewState();
}

class _HomeMenuViewState extends State<HomeMenuView> {
  int bottomSelectedIndex = 0;
  late StreamSubscription<Event> sub;
  final eventBus = GetIt.instance<EventBus>();

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  void initState() {
    sub = eventBus.stream<Event>().listen((event) {
      if (event is Balance) {
        bottomTapped(1);
      } else if (event is MyWallet) {
        bottomTapped(2);
      } else if (event is Courses) {
        bottomTapped(3);
      } else if (event is Settings) {
        bottomTapped(4);
      }
    });
    super.initState();
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  Widget buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        BalanceView(),
        MyWalletView(),
        CoursesView(),
        SettingsView(),
      ],
    );
  }

  Widget bottomNavigationBar() {
    return Container(
      height: 75,
      decoration: const BoxDecoration(
        color: Color(0x80414141),
        borderRadius: BorderRadius.all(Radius.circular(40)),
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(40.0),
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          unselectedItemColor: Colors.white.withOpacity(0.5),
          selectedItemColor: Colors.white,
          selectedLabelStyle:
              TextStyle(color: Theme.of(context).colorScheme.onSurface),
          currentIndex: bottomSelectedIndex,
          onTap: (index) {
            bottomTapped(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: ImageHelper.getSvg(SvgNames.homeIcon, color: Colors.white54),
              activeIcon: ImageHelper.getSvg(SvgNames.homeIcon),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon:
                  ImageHelper.getSvg(SvgNames.walletsIcon, color: Colors.white54),
              activeIcon: ImageHelper.getSvg(SvgNames.walletsIcon),
              label: 'Wallets',
            ),
            BottomNavigationBarItem(
              icon:
                  ImageHelper.getSvg(SvgNames.coursesIcon, color: Colors.white54),
              activeIcon: ImageHelper.getSvg(SvgNames.coursesIcon),
              label: 'Courses',
            ),
            BottomNavigationBarItem(
              icon:
                  ImageHelper.getSvg(SvgNames.settingsIcon, color: Colors.white54),
              activeIcon: ImageHelper.getSvg(SvgNames.settingsIcon),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildPageView(),
          Positioned(
            left: 50,
            right: 50,
            bottom: 20,
            child: bottomNavigationBar(),
          )
        ],
      ),
    );
  }
}
