import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jurta/screens/screens.dart';
import 'package:jurta/utils/utils.dart';
import 'package:line_icons/line_icons.dart';

class BookScreen extends StatefulWidget {
  static const String route = 'book_screen';

  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    final advert =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(LineIcons.angleLeft),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Text(
                    'ЗАБРОНИРОВАТЬ ПОКАЗ',
                    style: TextStyle(
                      fontSize: 12,
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
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          /// advert
          AdvertCard(advert: advert),
          const SizedBox(height: 16),

          /// calendar
          CalendarWidget(advert: advert),
        ],
      ),
    );
  }
}

class CalendarWidget extends StatefulWidget {
  final Map<String, dynamic> advert;

  const CalendarWidget({Key key, this.advert}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _selectedDate = DateTime.now();
  DateTime _selectedTime;
  DateTime _startTime = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 9, 0);
  DateTime _endTime = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 20, 30);

  @override
  Widget build(BuildContext context) {
    final diff = _endTime.difference(_startTime);

    return Column(
      children: [
        Text(
          DateFormat('d MMMM, yyyy | EEEE').format(_selectedDate),
          style: TextStyle(
            color: Colors.cyan,
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),

        /// next 7 days
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            7,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  _selectedDate = DateTime.now().add(Duration(days: index));
                });
              },
              child: Container(
                decoration: _selectedDate.day ==
                        DateTime.now().add(Duration(days: index)).day
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.cyan,
                      )
                    : null,
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    FittedBox(
                      child: Text(
                        DateFormat('dd')
                            .format(DateTime.now().add(Duration(days: index))),
                        style: TextStyle(
                          color: _selectedDate.day ==
                                  DateTime.now().add(Duration(days: index)).day
                              ? Colors.white
                              : null,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        DateFormat('EE')
                            .format(DateTime.now().add(Duration(days: index))),
                        style: TextStyle(
                          color: _selectedDate.day ==
                                  DateTime.now().add(Duration(days: index)).day
                              ? Colors.white
                              : null,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),

        /// times
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 8,
          children: List.generate(
            (diff.inMinutes / 30 + 1).toInt(),
            (index) => GestureDetector(
              onTap: () => setState(() => _selectedTime = DateTime(
                    _selectedDate.year,
                    _selectedDate.month,
                    _selectedDate.day,
                    _startTime.add(Duration(minutes: index * 30)).hour,
                    _startTime.add(Duration(minutes: index * 30)).minute,
                  )),
              child: Container(
                width: Global.getSize(context).width / 6,
                decoration: _selectedTime ==
                        DateTime(
                          _selectedDate.year,
                          _selectedDate.month,
                          _selectedDate.day,
                          _startTime.add(Duration(minutes: index * 30)).hour,
                          _startTime.add(Duration(minutes: index * 30)).minute,
                        )
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Style.orange,
                      )
                    : null,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(8),
                child: FittedBox(
                  child: Text(
                    DateFormat('kk:mm')
                        .format(_startTime.add(Duration(minutes: index * 30))),
                    style: TextStyle(
                      color: _selectedTime ==
                              DateTime(
                                _selectedDate.year,
                                _selectedDate.month,
                                _selectedDate.day,
                                _startTime
                                    .add(Duration(minutes: index * 30))
                                    .hour,
                                _startTime
                                    .add(Duration(minutes: index * 30))
                                    .minute,
                              )
                          ? Colors.white
                          : null,
                      fontSize: 12,
                    ),
                  ),
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
        ),

        /// book button
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: _selectedDate == null || _selectedTime == null
                ? null
                : () async {
                    await showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (c) {
                        return AlertDialog(
                          content: Container(
                            width: Global.getSize(c).width,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxHeight: 250,
                                    maxWidth: 250,
                                  ),
                                  child: Image.asset(
                                    'assets/images/enthusiastic_pana.png',
                                    height: Global.getSize(c).width / 2,
                                    width: Global.getSize(c).width / 2,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Бронирование показа недвижимости на',
                                  style: TextStyle(fontSize: 12),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${DateFormat('dd/MM/yyyy').format(_selectedTime)} в ${DateFormat('kk:mm').format(_selectedTime)}',
                                  style: TextStyle(
                                    color: Style.orange,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'успешно произведено!',
                                  style: TextStyle(fontSize: 12),
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  width: Global.getSize(c).width / 2,
                                  child: ElevatedButton(
                                    onPressed: () => Navigator.pop(c),
                                    child: Text(
                                      'OK',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Style.orange,
                                      elevation: 0,
                                      padding: const EdgeInsets.only(top: 4.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          insetPadding: const EdgeInsets.all(16),
                        );
                      },
                    );
                    Navigator.pop(context);
                  },
            child: Text(
              'ЗАБРОНИРОВАТЬ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.orange.shade900,
              elevation: 0,
              padding: const EdgeInsets.only(top: 4.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),

        const SizedBox(height: 56),
      ],
    );
  }
}
