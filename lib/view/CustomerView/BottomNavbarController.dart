// ignore_for_file: file_names

// Import Material
import "package:flutter/cupertino.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:flutter/material.dart";
import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";

// Import View
// import "package:atmabakerymobile/view/generalView/onBoarding.dart";
import "package:atmabakerymobile/view/CustomerView/CustomerHomepage/CustomerHome.dart";
import "package:atmabakerymobile/view/CustomerView/CustomerHomepage/CustomerSettings.dart";
import "package:atmabakerymobile/view/CustomerView/CustomerHomepage/CustomerSearchPage.dart";
import "package:atmabakerymobile/view/CustomerView/CustomerHistory/showHistory.dart";
import "package:atmabakerymobile/view/CustomerView/CustomerHistory/CustomerHistorySelesai/showHistoryDikirim.dart";
import "package:atmabakerymobile/view/CustomerView/CustomerHomepage/CustomerBrowse.dart";

class NavBarController extends StatelessWidget {
  const NavBarController({super.key});

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;
    controller = PersistentTabController(initialIndex: 0);

    List<Widget> buildScreens() {
      return [
        const CustomerHomePage(),
        //const SearchFromHomePage(),
        const BrowseView(),
        const ShowHistory(),
        const ShowHistorySelesai(),
        const SettingsPage(),
      ];
    }

    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.home),
          title: ("HomePage"),
          // activeColorPrimary: CupertinoColors.activeGreen,
          activeColorPrimary: CupertinoColors.black,
          // activeColorPrimary: const Color(0xFFF9F2ED),
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(FontAwesomeIcons.globe),
          title: ("Browse"),
          // activeColorPrimary: CupertinoColors.activeGreen,
          activeColorPrimary: CupertinoColors.black,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.square_list),
          title: ("History"),
          // activeColorPrimary: CupertinoColors.activeGreen,
          activeColorPrimary: CupertinoColors.black,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.cart_fill_badge_plus),
          title: ("On Delivery"),
          // activeColorPrimary: CupertinoColors.activeGreen,
          activeColorPrimary: CupertinoColors.black,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.settings),
          title: ("Settings"),
          // activeColorPrimary: CupertinoColors.activeGreen,
          activeColorPrimary: CupertinoColors.black,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: controller,
      screens: buildScreens(),
      items: navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style3,
    );
  }
}

// Link Paket Nav Bar
// https://pub.dev/packages/persistent_bottom_nav_bar