import 'package:flutter/material.dart';

class MenuDrawer extends StatefulWidget {
  @override
  _MenuDrawerState createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    final notch = MediaQuery.of(context).viewPadding.top;

    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SizedBox(height: notch),

          /// user info
          UserInfoWidget(),
          const SizedBox(height: 16),
          const Divider(),

          /// Location
          LocationWidget(),
          const Divider(),
          const SizedBox(height: 8),

          /// my applications
          MenuTile(icon: Icons.list, title: 'Мои заявки'),

          /// my applications
          MenuTile(
              icon: Icons.account_balance_wallet_outlined,
              title: 'История платежа'),

          /// my applications
          MenuTile(icon: Icons.notifications_none, title: 'Уведомления'),

          /// my applications
          MenuTile(icon: Icons.info_outlined, title: 'Информация'),

          /// my applications
          MenuTile(icon: Icons.chat_outlined, title: 'Чат с разработчиками'),

          /// my applications
          MenuTile(icon: Icons.person_pin_outlined, title: 'Найти специалиста'),

          /// my applications
          MenuTile(icon: Icons.settings_outlined, title: 'Настройки'),

          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const MenuTile({
    Key key,
    @required this.icon,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
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
  const UserInfoWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  color: Colors.teal.shade300,
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
    );
  }
}
