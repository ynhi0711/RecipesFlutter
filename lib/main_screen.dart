import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipes_flutter/screen/home/home_page.dart';
import 'package:recipes_flutter/screen/profile/profile_page.dart';
import 'package:recipes_flutter/screen/recipes/recipes_page.dart';
import 'package:recipes_flutter/screen/setting/setting_page.dart';

import 'const.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: _onPageViewChanged,
        children: [HomePage(), RecipesPage(), SettingPage(), ProfilePage()],
      ),
      bottomNavigationBar: buildBottomNavyBar(),
    );
  }

  BottomNavyBar buildBottomNavyBar() {
    return BottomNavyBar(
      items: [
        setupBottomNavyItem('Home', 'assets/icons/ic_home.svg', 0),
        setupBottomNavyItem('Recipes', 'assets/icons/ic_flag.svg', 1),
        setupBottomNavyItem('Setting', 'assets/icons/ic_security.svg', 2),
        BottomNavyBarItem(
            textAlign: TextAlign.center,
            activeColor: Const.primaryColor,
            title: Text(
              'Profile',
              style: TextStyle(fontSize: 12),
            ),
            icon: Image.asset('assets/images/ic_profile.png'))
      ],
      showElevation: false,
      selectedIndex: _selectedIndex,
      curve: Curves.easeInOut,
      onItemSelected: (int value) {
        setState(() {
          _selectedIndex = value;
          _pageController.animateToPage(value,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
        });
      },
    );
  }

  BottomNavyBarItem setupBottomNavyItem(
      String title, String svgPath, int position) {
    return BottomNavyBarItem(
        textAlign: TextAlign.center,
        activeColor: Const.primaryColor,
        icon: SvgPicture.asset(
          svgPath,
          color:
              _selectedIndex == position ? Const.primaryColor : Const.colorGray,
          height: 22,
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 12),
        ));
  }

  _onPageViewChanged(page) {
    setState(() {
      _selectedIndex = page;
    });
  }
}
