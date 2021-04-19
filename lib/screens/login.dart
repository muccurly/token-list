import 'package:flutter/material.dart';
import 'package:jurta/screens/screens.dart';
import 'package:jurta/utils/global.dart';
import 'package:jurta/utils/style.dart';

class LoginScreen extends StatefulWidget {
  static const String route = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _phoneC;
  TextEditingController _passwordC;

  @override
  void initState() {
    super.initState();
    _phoneC = TextEditingController();
    _passwordC = TextEditingController();
  }

  @override
  void dispose() {
    _phoneC.dispose();
    _passwordC.dispose();
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
            padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 250,
              maxWidth: 250,
            ),
            child: Image.asset(
              'assets/images/login_check.png',
              height: Global.getSize(context).width / 2,
              width: Global.getSize(context).width / 2,
            ),
          ),
          const SizedBox(width: 16),
          HeaderTextWidget(text: 'Контакты'),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: TextFormField(
              controller: _phoneC,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 0.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 0.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 0.5,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 0.5,
                  ),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: '+7 (---) --- -- --',
                hintStyle: TextStyle(
                  color: Colors.grey.shade300,
                  fontSize: 11,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),
                isDense: true,
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          HeaderTextWidget(text: 'Пароль'),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: TextFormField(
              controller: _passwordC,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 0.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 0.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 0.5,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 0.5,
                  ),
                ),
                fillColor: Colors.white,
                filled: true,
                // hintText: 'Пароль',
                // hintStyle: TextStyle(
                //   color: Colors.grey.shade300,
                //   fontSize: 11,
                // ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),
                isDense: true,
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(width: 16),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'ВОЙТИ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
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
    );
  }
}
