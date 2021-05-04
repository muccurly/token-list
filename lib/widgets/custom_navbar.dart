import 'package:flutter/material.dart';
import 'package:jurta/screens/screens.dart';
import 'package:jurta/utils/custom_icons_icons.dart';
import 'package:jurta/utils/utils.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key key,
    @required this.width,
    @required this.activeIndex,
    @required this.activeColor,
    @required this.inactiveColor,
    @required this.iconSize,
    @required this.titles,
    @required this.onTap,
  }) : super(key: key);

  final double width;
  final int activeIndex;
  final Color activeColor;
  final Color inactiveColor;
  final double iconSize;
  final List<String> titles;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        width: width,
        height: MediaQuery.of(context).viewInsets.bottom > 0 ? 0 : 56,
        color: Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomBarItemWidget(
                onTap: onTap,
                icon: CustomIcons.home,
                activeIndex: activeIndex,
                activeColor: activeColor,
                inactiveColor: inactiveColor,
                iconSize: iconSize,
                title: titles[0],
                index: 0),
            BottomBarItemWidget(
                onTap: onTap,
                icon: CustomIcons.search,
                activeIndex: activeIndex,
                activeColor: activeColor,
                inactiveColor: inactiveColor,
                iconSize: iconSize,
                title: titles[1],
                index: 1),
            InkWell(
              onTap: () => onTap(2),
              child: SizedBox(
                height: 32,
                width: 50,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 32,
                      width: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Style.orange,
                      ),
                    ),
                    Container(
                      height: 32,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Style.blue,
                      ),
                    ),
                    Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            BottomBarItemWidget(
                onTap: onTap,
                icon: CustomIcons.favourite,
                activeIndex: activeIndex,
                activeColor: activeColor,
                inactiveColor: inactiveColor,
                iconSize: iconSize,
                title: titles[2],
                index: 3),
            BottomBarItemWidget(
                onTap: onTap,
                icon: CustomIcons.menu,
                activeIndex: activeIndex,
                activeColor: activeColor,
                inactiveColor: inactiveColor,
                iconSize: iconSize,
                title: titles[3],
                index: 4),
          ],
        ),
      ),
    );
  }
}

class BottomBarItemWidget extends StatelessWidget {
  const BottomBarItemWidget({
    Key key,
    @required this.onTap,
    @required this.activeIndex,
    @required this.activeColor,
    @required this.inactiveColor,
    @required this.iconSize,
    @required this.title,
    @required this.icon,
    @required this.index,
  }) : super(key: key);

  final Function(int p1) onTap;
  final IconData icon;
  final int activeIndex;
  final int index;
  final Color activeColor;
  final Color inactiveColor;
  final double iconSize;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () => onTap(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: activeIndex == index ? activeColor : inactiveColor,
              size: iconSize,
            ),
            const SizedBox(height: 4),
            FittedBox(
              child: Text(
                title.toUpperCase(),
                style: TextStyle(
                  color: activeIndex == index ? activeColor : inactiveColor,
                  fontSize: 10,
                  fontFamily: 'HelveticaNeueCyr',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
