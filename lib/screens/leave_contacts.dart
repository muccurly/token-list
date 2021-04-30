import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jurta/screens/screens.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:jurta/utils/global.dart';
import 'package:jurta/utils/style.dart';
import 'package:jurta/utils/utils.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class LeaveContactsScreen extends StatefulWidget {
  static const String route = 'leave_contacts';
  int isPage = 1;
  //1 - Advert Details 2 - is Оставить заявку
  LeaveContactsScreen({@required this.isPage});
  @override
  _LeaveContactsScreenState createState() => _LeaveContactsScreenState();
}

class _LeaveContactsScreenState extends State<LeaveContactsScreen> {
  TextEditingController _phoneC;
  TextEditingController _nameC;

  @override
  void initState() {
    super.initState();
    _phoneC = TextEditingController();
    _nameC = TextEditingController();
  }

  @override
  void dispose() {
    _phoneC.dispose();
    _nameC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              Icons.arrow_back_rounded,
              // color: Colors.white,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        leading: null,
        titleSpacing: 0,
        centerTitle: false,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Text(
                'Как к Вам обращаться?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 300,
                  maxWidth: 300,
                ),
                child: Image.asset(
                  'assets/images/secure_data_pana.png',
                  // Global.getSize(context).height,
                  //Global.getSize(context).width,
                ),
              ),
              Row(children: [HeadersTextWidget(text: 'Имя')]),
              InputWidget(
                controller: _nameC,
                inputType: TextInputType.name,
              ),
              const SizedBox(height: 24),
              Row(children: [HeadersTextWidget(text: 'Контакты')]),
              InputWidget(
                controller: _phoneC,
                hintText: '+7 (___) ___-__-__',
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 13,
                ),
                textInputFormatters: PHONE_FORMATTER,
                inputType: TextInputType.phone,
                // hintText: '+7 (---) --- -- --',
                // hintStyle: TextStyle(
                //   color: Colors.grey.shade300,
                //   fontSize: 11,
                // ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Container(
                  height: 46,
                  width: Global.getSize(context).width,
                  child: ElevatedButton(
                    onPressed: () {
                      log(widget.isPage);
                      if (widget.isPage == 1) {
                        showRequestConfirmationDialog(context);
                      } else if (widget.isPage == 2) {
                        pushNewScreen(context,
                            screen: RieltorFrilancer7(), withNavBar: true);
                      }
                    },
                    child: Text(
                      'СОХРАНИТЬ',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showRequestConfirmationDialog(BuildContext context) {
  showDialog(
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
                'Ваша заявка на бронирование объекта принята,\nВ ближайшее время наши менеджеры свяжутся с вами\nСпасибо за обращение',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
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
        insetPadding: const EdgeInsets.all(16),
      );
    },
  );
}
