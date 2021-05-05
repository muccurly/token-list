import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jurta/providers/providers.dart';
import 'package:jurta/screens/screens.dart';
import 'package:jurta/utils/utils.dart';
import 'package:jurta/widgets/widgets.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class RootScreen extends StatefulWidget {
  static const String route = 'root_screen';

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final GlobalKey<ScaffoldState> _sKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    Global.setController(PersistentTabController(initialIndex: 0));
  }

  @override
  void dispose() {
    Global.disposeTabController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Global.rootSetState = setState;

    return Scaffold(
      key: _sKey,
      endDrawer: DrawerWrapper(type: DrawerType.menu, rootContext: context),
      endDrawerEnableOpenDragGesture: false,
      body: Consumer(
          // Rebuild only the Text when counterProvider updates
          builder: (context, watch, _) {
        final hideNavBar = watch(hideBottomTabProvider).state;

        return PersistentTabView.custom(
          context,
          controller: Global.getController(),
          screens: _pageOptions,
          itemCount: NAVBAR_ITEMS.length,
          confineInSafeArea: true,
          backgroundColor: Colors.white,
          handleAndroidBackButtonPress: true,
          // bottomScreenMargin: 0.0,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBar: hideNavBar ?? false,
          hideNavigationBarWhenKeyboardShows: true,
          customWidget: CustomNavBar(
            width: width,
            titles: NAVBAR_TITLE_LIST,
            activeColor: Style.orange,
            inactiveColor: Colors.black,
            activeIndex: Global.getController().index,
            iconSize: 21,
            onTap: (index) {
              if (index != 4) {
                setState(() => Global.getController().index = index);
              } else
                _sKey.currentState.openEndDrawer();
            },
          ),
        );
      }),
    );
  }
}

List<Widget> _pageOptions = [
  HomeScreen(),
  SearchScreen(),
  PlusScreen(),
  FavoriteScreen(),
  Container(),
];
