import 'package:flutter/material.dart';
import 'package:jurta/screens/booking_form.dart';

import 'package:jurta/utils/utils.dart';

import 'package:jurta/widgets/rules_checkbox.dart';
import 'package:jurta/widgets/rules_text_scrollable.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

/*Страница Ознакомьтесь с правилами*/
class RulesScreen extends StatefulWidget {
  final Map<String, dynamic> advert;
  RulesScreen({@required this.advert});

  @override
  _RulesScreenState createState() => _RulesScreenState();
}

class _RulesScreenState extends State<RulesScreen> {
  bool _readRules = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.arrow_back_rounded, size: 20),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0, left: 4.0),
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
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [
            Text(
              'Ознакомьтесь с правилами',
              style: TextStyle(
                color: Style.blue,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RulesText(),

            /// income switch
            RulesCheckbox(
              title: 'С правилами ознакомлен (-а)',
              switchValue: _readRules,
              onChanged: (val) => setState(() => _readRules = val),
            ),

            const SizedBox(height: 16),

            /// cancel button
            Container(
              height: 46,
              width: Global.getSize(context).width,
              child: ElevatedButton(
                onPressed: _readRules
                    ? () {
                        pushNewScreen(context,
                            screen: BookingFormScreen(
                              advert: widget.advert,
                            ));
                      }
                    : null,
                child: Text(
                  'Далее',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Style.blue,
                  elevation: 0,
                  padding: const EdgeInsets.only(top: 2.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            /// save button
          ],
        ),
      ),
    );
  }
}
