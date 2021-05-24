import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jurta/screens/rules.dart';
import 'package:jurta/screens/screens.dart';
import 'package:jurta/utils/global.dart';
import 'package:jurta/utils/style.dart';
import 'package:jurta/utils/utils.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class LeaveContactsScreen extends StatefulWidget {
  static const String route = 'leave_contacts';
  int isPage = 1;
  final Map<String, dynamic> advert;
  //1 - Advert Details 2 - is Оставить заявку
  LeaveContactsScreen({@required this.isPage, this.advert});
  @override
  _LeaveContactsScreenState createState() => _LeaveContactsScreenState();
}

class _LeaveContactsScreenState extends State<LeaveContactsScreen> {
  final TextEditingController _phoneC = TextEditingController();
  final TextEditingController _nameC = TextEditingController();

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
      body: SingleChildScrollView(
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
            const SizedBox(height: 20),
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
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
              child: Container(
                height: 46,
                width: Global.getSize(context).width,
                child: ElevatedButton(
                  onPressed: () {
                    log(widget.isPage);
                    if (widget.isPage == 1) {
                      // Navigator.pop(context, true);
                      pushNewScreen(context,
                          screen: RulesScreen(), withNavBar: false);
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
    );
  }
}
