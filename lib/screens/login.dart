import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jurta/screens/screens.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:jurta/utils/global.dart';
import 'package:jurta/utils/style.dart';
import 'package:jurta/utils/utils.dart';

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
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 300,
                  maxWidth: 300,
                ),
                child: Image.asset(
                  'assets/images/login_check.png',
                  // height: Global.getSize(context).height / 2,
                  // width: Global.getSize(context).width / 2,
                ),
              ),
              const SizedBox(width: 16),
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
              Row(children: [HeadersTextWidget(text: 'Пароль')]),
              InputWidget(
                  controller: _passwordC,
                  inputType: TextInputType.visiblePassword,
                  obscureText: true),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Container(
                  height: 46,
                  width: Global.getSize(context).width,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'ВОЙТИ',
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

class HeadersTextWidget extends StatelessWidget {
  final String text;

  const HeadersTextWidget({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class InputWidget extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final bool obscureText;
  final String hintText;
  final TextStyle hintStyle;
  final List<TextInputFormatter> textInputFormatters;

  const InputWidget(
      {Key key,
      @required this.controller,
      @required this.inputType,
      this.hintText,
      this.hintStyle,
      this.textInputFormatters,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
          height: 46,
          width: Global.getSize(context).width,
          child: TextFormField(
            inputFormatters: textInputFormatters,
            obscureText: obscureText,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: hintStyle,
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
              fillColor: const Color.fromRGBO(238, 238, 238, 1.0),
              filled: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              isDense: true,
            ),
            keyboardType: inputType,
          )),
    );
  }
}
