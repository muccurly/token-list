import 'package:flutter/material.dart';
import 'package:jurta/utils/utils.dart';

class NotificationSettingsScreen extends StatefulWidget {
  @override
  _NotificationSettingsScreenState createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool _pauseAll = false;
  bool _newNotification = false;
  bool _priceFall = false;
  bool _commentAnswer = false;
  bool _upcomingEvents = false;

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
                    'НАСТРОЙКА УВЕДОМЛЕНИЙ',
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
          /// pause all
          NotificationSettingsTile(
            title: 'Приостановить все',
            switchValue: _pauseAll,
            onChanged: (val) => setState(() => _pauseAll = val),
          ),

          /// new notifications
          NotificationSettingsTile(
            title: 'Новые объявления',
            subtitle:
                'Получать уведомления, если новые объявления соответствуют сохраненным параметрам поиска',
            switchValue: _newNotification,
            onChanged: (val) => setState(() => _newNotification = val),
          ),

          /// price fall
          NotificationSettingsTile(
            title: 'Снижение цен',
            subtitle:
                'Получать уведомления о снижении цен на объвления из Избранного',
            switchValue: _priceFall,
            onChanged: (val) => setState(() => _priceFall = val),
          ),

          /// answers to comments
          NotificationSettingsTile(
            title: 'Ответы на комментарии',
            subtitle:
                'Получать уведомления об ответах на оставленный комментарий',
            switchValue: _commentAnswer,
            onChanged: (val) => setState(() => _commentAnswer = val),
          ),

          /// upcoming events
          NotificationSettingsTile(
            title: 'Предстоящие события',
            subtitle:
                'Получать уведомления о предстоящих событиях (встречи, показы)',
            switchValue: _upcomingEvents,
            onChanged: (val) => setState(() => _upcomingEvents = val),
          ),
        ],
      ),
    );
  }
}

class NotificationSettingsTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool switchValue;
  final double padding;
  final Function(bool val) onChanged;

  const NotificationSettingsTile({
    Key key,
    this.title,
    this.subtitle,
    this.switchValue,
    this.padding,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!switchValue);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(padding ?? 8, 8, 8, 8),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.grey.shade300, width: 0.5),
        ),
        child: Row(
          children: [
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
            Transform.scale(
              scale: 0.6,
              child: Switch(
                value: switchValue,
                onChanged: (val) => onChanged(val),
                activeColor: Style.orange,
                inactiveThumbColor: Style.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
