import 'package:flutter/material.dart';
import 'package:jurta/providers/providers.dart';
import 'package:jurta/screens/screens.dart';
import 'package:jurta/utils/utils.dart';
import 'package:jurta/widgets/widgets.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

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
    Global.rootSetState = setState;

    return Scaffold(
      key: _sKey,
      endDrawer: DrawerWrapper(type: DrawerType.menu, rootContext: context),
      endDrawerEnableOpenDragGesture: false,
      body: Consumer<TabProvider>(
        builder: (c, tab, w) => PersistentTabView.custom(
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
          hideNavigationBar: tab.hideNavBar ?? false,
          hideNavigationBarWhenKeyboardShows: true,
          customWidget: CustomNavBar(
            icons: NAVBAR_ICON_LIST,
            titles: NAVBAR_TITLE_LIST,
            activeColor: Style.orange,
            inactiveColor: Colors.black,
            activeIndex: Global.getController().index,
            iconSize: 24,
            onTap: (index) {
              if (index != 3) {
                setState(() => Global.getController().index = index);
              } else
                _sKey.currentState.openEndDrawer();
            },
          ),
        ),
      ),
    );
  }
}

List<Widget> _pageOptions = [
  HomeScreen(),
  SearchScreen(),
  FavoriteScreen(),
  Container(),
];
