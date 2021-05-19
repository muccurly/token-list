import 'package:flutter/material.dart';
import 'package:jurta/screens/rate_agent_new.dart';
import 'package:jurta/screens/screens.dart';
import 'package:jurta/utils/utils.dart';
import 'package:flutter/services.dart';

import 'package:jurta/widgets/form_tile.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BookingFormScreen extends StatefulWidget {
  BookingFormScreen({Key key}) : super(key: key);

  @override
  _BookingFormScreenState createState() => _BookingFormScreenState();
}

class _BookingFormScreenState extends State<BookingFormScreen> {
  final TextEditingController _nameC = TextEditingController();
  final TextEditingController _surnameC = TextEditingController();
  final TextEditingController _patronymicC = TextEditingController();
  final TextEditingController _iinC = TextEditingController();
  final TextEditingController _docNumberC = TextEditingController();
  final TextEditingController _docDateC = TextEditingController();
  final TextEditingController _docOrgC = TextEditingController();
  final TextEditingController _addressC = TextEditingController();
  final TextEditingController _phoneC = TextEditingController();
  final TextEditingController _bookAmountC = TextEditingController();

  @override
  void dispose() {
    _nameC.dispose();
    _surnameC.dispose();
    _patronymicC.dispose();
    _iinC.dispose();
    _docNumberC.dispose();
    _docDateC.dispose();
    _docOrgC.dispose();
    _addressC.dispose();
    _phoneC.dispose();
    _bookAmountC.dispose();
    super.dispose();
  }

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
                    child: Text(
                      'ЗАБРОНИРОВАТЬ',
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
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          children: [
            /// surname
            FormTile(
              controller: _surnameC,
              title: 'ФАМИЛИЯ',
              hintText: 'ФАМИЛИЯ',
              keyboardType: TextInputType.name,
            ),

            /// name
            FormTile(
              controller: _nameC,
              title: 'ИМЯ',
              hintText: 'ИМЯ',
              keyboardType: TextInputType.name,
            ),

            /// patronymic
            FormTile(
              controller: _patronymicC,
              title: 'Адрес',
              hintText: 'ОТЧЕСТВО',
              keyboardType: TextInputType.name,
            ),

            /// ИИН
            FormTile(
              controller: _iinC,
              title: 'ИИН',
              hintText: '903227334432',
              keyboardType: TextInputType.number,
              textInputFormatters: NUMERIC_FORMATTER,
            ),

            ///Документы данные
            Row(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 6,
                  child: FormTile(
                    controller: _docNumberC,
                    title: '№ ДОКУМЕНТА',
                    hintText: '1234567',
                    keyboardType: TextInputType.number,
                    textInputFormatters: NUMERIC_FORMATTER,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Flexible(
                  flex: 5,
                  child: FormTile(
                    controller: _docDateC,
                    title: 'ОТ',
                    hintText: '18.05.1995',
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Flexible(
                  flex: 5,
                  child: FormTile(
                    controller: _docOrgC,
                    title: 'ВЫДАН',
                    hintText: 'МВД РК',
                    keyboardType: TextInputType.name,
                  ),
                ),
              ],
            ),

            ///address
            FormTile(
              controller: _addressC,
              title: 'АДРЕС',
              hintText: 'г. Нур-Султан, ул. Сауран 23, кв 55',
              keyboardType: TextInputType.streetAddress,
            ),

            /// phone
            FormTile(
              controller: _phoneC,
              title: 'КОНТАКТЫ',
              hintText: '+7 (___) ___-__-__',
              keyboardType: TextInputType.phone,
              textInputFormatters: PHONE_FORMATTER,
            ),

            /// loan
            FormTile(
              controller: _bookAmountC,
              title: 'СУММА БРОНИРОВАНИЯ',
              hintText: '100 000',
              keyboardType: TextInputType.number,
              textInputFormatters: MONEY_FORMATTER,
            ),
            const SizedBox(height: 16),

            /// cancel button
            Container(
              height: 46,
              width: Global.getSize(context).width,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Отменить',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
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
            Container(
              height: 46,
              width: Global.getSize(context).width,
              child: ElevatedButton(
                onPressed: () {
                  //Navigator.pop(context, true);
                  showRequestConfirmationDialog(context);
                  //pushNewScreen(context, screen: RateAgentNewScreen());
                },
                child: Text(
                  'ЗАБРОНИРОВАТЬ ОБЪЕКТ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Style.orange,
                  elevation: 0,
                  padding: const EdgeInsets.only(top: 2.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
