import 'package:flutter/material.dart';
import 'package:jurta/screens/screens.dart';
import 'package:jurta/utils/utils.dart';
import 'package:line_icons/line_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back_rounded, size: 20),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0, left: 4.0),
                  child: Text(
                    'УВЕДОМЛЕНИЯ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        leading: null,
        titleSpacing: 0,
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ...NOTIFICATIONS
              .map(
                (notification) => NotificationTile(
                  imagePath: notification['imagePath'],
                  imageUrl: notification['imageUrl'],
                  title: notification['title'],
                  subtitle: notification['subtitle'],
                  datetime: notification['datetime'],
                ),
              )
              .toList(),
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            pushNewScreen(context, screen: NotificationSettingsScreen());
          },
          child: Row(
            children: [
              ImageIcon(
                AssetImage('assets/images/settings.png'),
                color: Colors.white,
                size: 24,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Настройка уведомлений',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                LineIcons.angleRight,
                color: Colors.white,
                size: 24,
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            primary: Style.orange2,
            padding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String imagePath;
  final String imageUrl;
  final String title;
  final String subtitle;
  final String datetime;

  const NotificationTile({
    Key key,
    this.imagePath,
    this.imageUrl,
    this.title,
    this.subtitle,
    this.datetime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey.shade300, width: 0.5),
      ),
      child: Row(
        children: [
          ImageIcon(
            imageUrl != null ? NetworkImage(imageUrl) : AssetImage(imagePath),
            color: Style.orange,
            size: 24,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// title
                Text(
                  title ?? '--',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                /// subtitle
                if (subtitle != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      subtitle ?? '--',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: Global.getSize(context).width / 5,
            child: Text(
              datetime ?? '--:--',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
