import 'package:flutter/material.dart';
import 'package:jurta/screens/info.dart';
import 'package:jurta/screens/our_specialists.dart';
import 'package:jurta/screens/rules.dart';
import 'package:jurta/screens/screens.dart';
import 'package:jurta/utils/custom_icons_icons.dart';
import 'package:jurta/utils/utils.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MenuDrawer extends StatelessWidget {
  final BuildContext rootContext;

  const MenuDrawer({Key key, this.rootContext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: Global.getViewPadding(context).top),

            /// user info
            UserInfoWidget(rootContext: rootContext),
            const SizedBox(height: 16),
            const Divider(),

            /// Location
            LocationWidget(),
            const Divider(),
            const SizedBox(height: 8),

            /// my applications
            MenuTile(
              icon: CustomIcons.list,
              title: 'Мои заявки',
              screen: MyApplicationScreen(),
              rootContext: rootContext,
            ),

            /// payment history
            // MenuTile(
            //     icon: 'assets/images/payment_history.png',
            //     title: 'История платежа'),

            /// notification
            MenuTile(
              icon: CustomIcons.notification,
              title: 'Уведомления',
              screen: NotificationScreen(),
              rootContext: rootContext,
              trailing: true,
            ),

            /// info
            MenuTile(
              icon: CustomIcons.info,
              title: 'Информация',
              screen: InfoScreen(),
              rootContext: rootContext,
            ),

            /// chat with developers
            // MenuTile(
            //     icon: 'assets/images/chat_double.png',
            //     title: 'Чат с разработчиками'),

            /// find master
            MenuTile(
              icon: CustomIcons.find_master,
              title: 'Найти специалиста',
              screen: OurSpeicalistsScreen(),
              rootContext: rootContext,
            ),

            /// settings
            // MenuTile(icon: 'assets/images/settings.png', title: 'Настройки'),

            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: ElevatedButton(
                onPressed: () {
                  pushNewScreen(
                    context,
                    screen: LoginScreen(),
                  );
                },
                child: Text(
                  'ВЫЙТИ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Style.blue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget screen;
  final BuildContext rootContext;
  final bool trailing;

  const MenuTile({
    Key key,
    @required this.icon,
    @required this.title,
    this.screen,
    this.rootContext,
    this.trailing = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: screen == null
          ? null
          : () {
              Navigator.pop(context);
              pushNewScreen(
                rootContext,
                screen: screen,
                withNavBar: true,
              );
            },
      leading: Icon(icon, size: 20),
      title: trailing
          ? Row(
              children: [
                Text(
                  title ?? '',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 8),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(2),
                  constraints: BoxConstraints(minWidth: 20, minHeight: 20),
                  decoration: BoxDecoration(
                    color: Style.orange,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Text(
                      '${NOTIFICATIONS.length}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Text(
              title ?? '',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
      horizontalTitleGap: -8,
    );
  }
}

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.location_on,
            color: Colors.black54,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              'Казахстан, Нур-Султан',
              style: TextStyle(color: Colors.black54),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class UserInfoWidget extends StatelessWidget {
  final BuildContext rootContext;

  const UserInfoWidget({
    Key key,
    this.rootContext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        pushNewScreen(
          rootContext,
          screen: ProfileScreen(),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1527585743534-7113e3211270?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=100&q=80'),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Умурзаков Темирлан',
                  style: TextStyle(fontWeight: FontWeight.w700),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Style.blue2,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  margin: const EdgeInsets.only(top: 8),
                  child: Text(
                    'Эксперт',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
