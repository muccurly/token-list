import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:jurta/utils/utils.dart';
import 'package:jurta/widgets/finish_button.dart';

class RateCallCenterScreen extends StatefulWidget {
  static const String route = 'rate_call_center';

  @override
  _RateCallCenterScreenState createState() => _RateCallCenterScreenState();
}

class _RateCallCenterScreenState extends State<RateCallCenterScreen> {
  bool buttonGroup1 = true;
  bool buttonGroup2 = true;
  bool buttonGroup3 = true;
  bool buttonGroup4 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 10, top: 70, left: 25, right: 25),
            child: Column(
              children: [
                //text
                Text(
                  'Оцените звонок КЦ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),

                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 300,
                    maxWidth: 300,
                  ),
                  child: Image.asset(
                    'assets/images/call_center_bro.png',
                    height: Global.getSize(context).width / 1.2,
                    width: Global.getSize(context).width / 1.2,
                  ),
                ),

                ///ButtonGroup2
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Visibility(
                      visible: buttonGroup2,
                      child: Container(
                        width: 150,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              buttonGroup2 = false;
                            });
                          },
                          child: FittedBox(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/images/notaccept.svg",
                                  color: Style.green,
                                  width: 16,
                                  height: 16,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Быстро         ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Style.green,
                                      ),
                                    ),
                                    Text(
                                      'связались        ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Style.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).canvasColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(
                                color: Style.green,
                                width: 1,
                              ),
                            ),
                            elevation: 0,
                          ),
                        ),
                      ),
                      replacement: Container(
                        width: 150,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () => {
                            setState(() {
                              buttonGroup2 = true;
                            }),
                          },
                          child: FittedBox(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/images/accept.svg",
                                  color: Style.grey,
                                  width: 16,
                                  height: 16,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Быстро         ',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Style.grey),
                                    ),
                                    Text(
                                      'связались        ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Style.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).canvasColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(
                                color: Style.grey,
                                width: 1,
                              ),
                            ),
                            elevation: 0,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: buttonGroup2,
                      child: Container(
                        width: 150,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              buttonGroup2 = false;
                            });
                          },
                          child: FittedBox(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/images/accept.svg",
                                  color: Style.grey,
                                  width: 16,
                                  height: 16,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Пришлось         ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Style.grey,
                                      ),
                                    ),
                                    Text(
                                      'ждать            ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Style.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).canvasColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(
                                color: Style.grey,
                                width: 1,
                              ),
                            ),
                            elevation: 0,
                          ),
                        ),
                      ),
                      replacement: Container(
                        width: 150,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () => {
                            setState(() {
                              buttonGroup2 = true;
                            })
                          },
                          child: FittedBox(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/images/notaccept.svg",
                                  color: Style.red,
                                  width: 16,
                                  height: 16,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Пришлось         ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Style.red,
                                      ),
                                    ),
                                    Text(
                                      'ждать            ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Style.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).canvasColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(
                                color: Style.red,
                                width: 1,
                              ),
                            ),
                            elevation: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                ///ButtonGroup3
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Visibility(
                      visible: buttonGroup3,
                      child: Container(
                        width: 150,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              buttonGroup3 = false;
                            });
                          },
                          child: FittedBox(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/images/notaccept.svg",
                                  color: Style.green,
                                  width: 18,
                                  height: 18,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Получил нужную',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Style.green,
                                      ),
                                    ),
                                    Text(
                                      'информацию',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Style.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).canvasColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(
                                color: Style.green,
                                width: 1,
                              ),
                            ),
                            elevation: 0,
                          ),
                        ),
                      ),
                      replacement: Container(
                        width: 150,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () => {
                            setState(() {
                              buttonGroup3 = true;
                            }),
                          },
                          child: FittedBox(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/images/accept.svg",
                                  color: Style.grey,
                                  width: 18,
                                  height: 18,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Получил нужную',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Style.grey,
                                      ),
                                    ),
                                    Text(
                                      'информацию',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Style.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).canvasColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(
                                color: Style.grey,
                                width: 1,
                              ),
                            ),
                            elevation: 0,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: buttonGroup3,
                      child: Container(
                        width: 150,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              buttonGroup3 = false;
                            });
                          },
                          child: FittedBox(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/images/accept.svg",
                                  color: Style.grey,
                                  width: 16,
                                  height: 16,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ничего         ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Style.grey,
                                      ),
                                    ),
                                    Text(
                                      'непонятно         ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Style.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).canvasColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(
                                color: Style.grey,
                                width: 1,
                              ),
                            ),
                            elevation: 0,
                          ),
                        ),
                      ),
                      replacement: Container(
                        width: 150,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () => {
                            setState(() {
                              buttonGroup3 = true;
                            })
                          },
                          child: FittedBox(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/images/notaccept.svg",
                                  color: Style.red,
                                  width: 16,
                                  height: 16,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ничего         ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Style.red,
                                      ),
                                    ),
                                    Text(
                                      'непонятно         ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Style.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).canvasColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(
                                color: Style.grey,
                                width: 1,
                              ),
                            ),
                            elevation: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),

                ///ButtonGroup4
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Visibility(
                      visible: buttonGroup4,
                      child: Container(
                        width: 150,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              buttonGroup4 = false;
                            });
                          },
                          child: FittedBox(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/images/notaccept.svg",
                                  color: Style.green,
                                  width: 16,
                                  height: 16,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Приятный         ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Style.green,
                                      ),
                                    ),
                                    Text(
                                      'диалог        ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Style.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).canvasColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(
                                color: Style.green,
                                width: 1,
                              ),
                            ),
                            elevation: 0,
                          ),
                        ),
                      ),
                      replacement: Container(
                        width: 150,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () => {
                            setState(() {
                              buttonGroup4 = true;
                            }),
                          },
                          child: FittedBox(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/images/accept.svg",
                                  color: Style.grey,
                                  width: 16,
                                  height: 16,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Приятный         ',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Style.grey),
                                    ),
                                    Text(
                                      'диалог        ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Style.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).canvasColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(
                                color: Style.grey,
                                width: 1,
                              ),
                            ),
                            elevation: 0,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: buttonGroup4,
                      child: Container(
                        width: 150,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              buttonGroup4 = false;
                            });
                          },
                          child: FittedBox(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/images/accept.svg",
                                  color: Style.grey,
                                  width: 16,
                                  height: 16,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Диалог   ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Style.grey,
                                      ),
                                    ),
                                    Text(
                                      'не состоялся   ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Style.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).canvasColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(
                                color: Style.grey,
                                width: 1,
                              ),
                            ),
                            elevation: 0,
                          ),
                        ),
                      ),
                      replacement: Container(
                        width: 150,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () => {
                            setState(() {
                              buttonGroup4 = true;
                            })
                          },
                          child: FittedBox(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/images/notaccept.svg",
                                  color: Style.red,
                                  width: 16,
                                  height: 16,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Диалог   ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Style.red,
                                      ),
                                    ),
                                    Text(
                                      'не состоялся   ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Style.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).canvasColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(
                                color: Style.red,
                                width: 1,
                              ),
                            ),
                            elevation: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),

                /// Завершить заявку кнопка
                FinishButton(
                  func: () {
                    print('asd');
                  },
                ),

                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
