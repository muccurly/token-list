import 'package:flutter/material.dart';
import 'package:jurta/screens/screens.dart';
import 'package:jurta/utils/utils.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class CustomNavBar extends StatefulWidget {
  final int activeIndex;
  final double bubbleRadius;
  final double maxBubbleRadius;
  final Color bubbleColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<String> icons;
  final double iconScale;
  final double iconSize;
  final List<String> titles;
  final Function(int) onTap;

  CustomNavBar({
    this.activeIndex,
    this.bubbleRadius,
    this.maxBubbleRadius,
    this.bubbleColor,
    this.activeColor,
    this.inactiveColor,
    this.icons,
    this.iconScale,
    this.iconSize,
    this.titles,
    this.onTap,
  }) : super();

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        /// Custom Bottom Navigation Bar
        CustomNavBarItemsWidget(
          width: width,
          icons: NAVBAR_ICON_LIST,
          titles: NAVBAR_TITLE_LIST,
          activeColor: Style.orange,
          inactiveColor: Colors.black,
          activeIndex: widget.activeIndex,
          iconSize: widget.iconSize,
          onTap: widget.onTap,
        ),

        /// Plus button in the center
        Positioned(
          top: 0,
          bottom: 0,
          left: Global.getSize(context).width * 2 / 5,
          right: Global.getSize(context).width * 2 / 5,
          child: Hero(
            tag: 'PLUS_BUTTON',
            child: GestureDetector(
              onTap: () {
                pushNewScreen(context, screen: PlusScreen(), pageTransitionAnimation: 
                PageTransitionAnimation.fade);
              },
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 32,
                      width: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Style.orange,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 32,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Style.blue,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomNavBarItemsWidget extends StatelessWidget {
  const CustomNavBarItemsWidget({
    Key key,
    @required this.width,
    @required this.activeIndex,
    @required this.activeColor,
    @required this.inactiveColor,
    @required this.icons,
    @required this.iconSize,
    @required this.titles,
    @required this.onTap,
  }) : super(key: key);

  final double width;
  final int activeIndex;
  final Color activeColor;
  final Color inactiveColor;
  final List<String> icons;
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: width / 5,
              child: InkWell(
                onTap: () => onTap(icons.indexOf(icons[0])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImageIcon(
                      AssetImage(icons[0]),
                      color: activeIndex == 0 ? activeColor : inactiveColor,
                      size: iconSize,
                    ),
                    FittedBox(
                      child: Text(
                        titles[0],
                        style: TextStyle(
                          color: activeIndex == 0 ? activeColor : inactiveColor,
                          fontSize: 12,
                          fontFamily: 'HelveticaNeueCyr',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: width / 5,
              margin: EdgeInsets.only(right: width / 10),
              child: InkWell(
                onTap: () => onTap(icons.indexOf(icons[1])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImageIcon(
                      AssetImage(icons[1]),
                      color: activeIndex == 1 ? activeColor : inactiveColor,
                      size: iconSize,
                    ),
                    FittedBox(
                      child: Text(
                        titles[1],
                        style: TextStyle(
                          color: activeIndex == 1 ? activeColor : inactiveColor,
                          fontSize: 12,
                          fontFamily: 'HelveticaNeueCyr',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: width / 5,
              margin: EdgeInsets.only(left: width / 10),
              child: InkWell(
                onTap: () => onTap(icons.indexOf(icons[2])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImageIcon(
                      AssetImage(icons[2]),
                      color: activeIndex == 2 ? activeColor : inactiveColor,
                      size: iconSize,
                    ),
                    FittedBox(
                      child: Text(
                        titles[2],
                        style: TextStyle(
                          color: activeIndex == 2 ? activeColor : inactiveColor,
                          fontSize: 12,
                          fontFamily: 'HelveticaNeueCyr',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: width / 5,
              child: InkWell(
                onTap: () => onTap(icons.indexOf(icons[3])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImageIcon(
                      AssetImage(icons[3]),
                      color: activeIndex == 3 ? activeColor : inactiveColor,
                      size: iconSize,
                    ),
                    FittedBox(
                      child: Text(
                        titles[3],
                        style: TextStyle(
                          color: activeIndex == 3 ? activeColor : inactiveColor,
                          fontSize: 12,
                          fontFamily: 'HelveticaNeueCyr',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
