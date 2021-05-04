import 'package:flutter/material.dart';
import 'package:jurta/screens/screens.dart';
import 'package:jurta/utils/utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class MortgageFormScreen extends StatefulWidget {
  @override
  _MortgageFormScreenState createState() => _MortgageFormScreenState();
}

class _MortgageFormScreenState extends State<MortgageFormScreen> {
  final TextEditingController _phoneC = TextEditingController();
  final TextEditingController _fullNameC = TextEditingController();
  final TextEditingController _creditAmountC = TextEditingController();
  final TextEditingController _durationC = TextEditingController();
  final TextEditingController _incomeC = TextEditingController();
  final TextEditingController _loanC = TextEditingController();
  bool _existingCredits = false;

  @override
  void dispose() {
    _phoneC.dispose();
    _fullNameC.dispose();
    _creditAmountC.dispose();
    _durationC.dispose();
    _incomeC.dispose();
    _loanC.dispose();
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
                      'АНКЕТА',
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
            /// phone
            FormTile(
              controller: _phoneC,
              title: 'Номер телефона',
              hintText: '+7 (___) ___-__-__',
              keyboardType: TextInputType.phone,
              textInputFormatters: PHONE_FORMATTER,
            ),

            /// fullname
            FormTile(
              controller: _fullNameC,
              title: 'ФИО',
              hintText: 'ФИО',
              keyboardType: TextInputType.name,
            ),

            /// credit amount
            FormTile(
              controller: _creditAmountC,
              title: 'Сумма кредита, тг',
              hintText: '25000000',
              keyboardType: TextInputType.number,
              textInputFormatters: MONEY_FORMATTER,
            ),

            /// duration
            FormTile(
              controller: _durationC,
              title: 'Срок, месяц',
              hintText: '60',
              keyboardType: TextInputType.number,
              textInputFormatters: NUMERIC_FORMATTER,
            ),

            /// income
            FormTile(
              controller: _incomeC,
              title: 'Общий доход, тг/мес',
              hintText: '250000',
              keyboardType: TextInputType.number,
              textInputFormatters: MONEY_FORMATTER,
            ),

            /// income switch
            NotificationSettingsTile(
              title: 'Действующие кредиты',
              padding: 16.0,
              switchValue: _existingCredits,
              onChanged: (val) => setState(() => _existingCredits = val),
            ),

            /// loan
            FormTile(
              controller: _loanC,
              title: 'Платеж по действующим займам, тг/мес',
              hintText: '100000',
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
                  Navigator.pop(context, true);
                },
                child: Text(
                  'СОХРАНИТЬ',
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

class FormTile extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  final TextInputType keyboardType;
  final List<TextInputFormatter> textInputFormatters;

  const FormTile({
    Key key,
    this.controller,
    this.title,
    this.hintText,
    this.keyboardType,
    this.textInputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey.shade300, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// title
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              title ?? '--',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 8),

          /// form field
          TextFormField(
            controller: controller,
            inputFormatters: textInputFormatters,
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              fillColor: Colors.white,
              filled: true,
              hintText: hintText ?? '',
              hintStyle: TextStyle(
                color: Colors.grey.shade300,
                fontSize: 14,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 5,
              ),
              isDense: true,
            ),
            style: TextStyle(
              color: Style.orange,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            keyboardType: keyboardType ?? TextInputType.text,
          ),
        ],
      ),
    );
  }
}
