import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:jurta/screens/screens.dart';

import 'package:jurta/utils/utils.dart';
import 'package:jurta/widgets/finish_button.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class RateAgentScreen extends StatefulWidget {
  static const String route = 'rate_agent';

  @override
  _RateAgentScreenState createState() => _RateAgentScreenState();
}

class _RateAgentScreenState extends State<RateAgentScreen> {
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
                  'Оцените агента',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: Global.getSize(context).height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 125,
                        maxWidth: 125,
                      ),
                      child: Image.asset(
                        'assets/images/agent1.png',
                        height: Global.getSize(context).width / 2,
                        width: Global.getSize(context).width / 2,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 125,
                        maxWidth: 125,
                      ),
                      child: Image.asset(
                        'assets/images/agent2.png',
                        height: Global.getSize(context).width / 2,
                        width: Global.getSize(context).width / 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),

                ///Button Group1
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Visibility(
                      visible: buttonGroup1,
                      child: Container(
                        width: 150,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              buttonGroup1 = false;
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
                                Text(
                                  'Все понятно',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Style.green,
                                  ),
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
                              buttonGroup1 = true;
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
                                Text(
                                  'Все понятно',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Style.grey,
                                  ),
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
                      visible: buttonGroup1,
                      child: Container(
                        width: 150,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              buttonGroup1 = false;
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
                                      'Ничего      ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Style.grey,
                                      ),
                                    ),
                                    Text(
                                      'непонятно     ',
                                      style: TextStyle(
                                        fontSize: 14,
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
                              buttonGroup1 = true;
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
                                      'Ничего      ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Style.red,
                                      ),
                                    ),
                                    Text(
                                      'непонятно     ',
                                      style: TextStyle(
                                        fontSize: 14,
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
                                      'Идеальный     ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Style.green,
                                      ),
                                    ),
                                    Text(
                                      'внешний вид    ',
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
                                      'Идеальный     ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Style.grey,
                                      ),
                                    ),
                                    Text(
                                      'внешний вид    ',
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
                                  width: 19,
                                  height: 19,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Расскажите ему',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Style.grey,
                                      ),
                                    ),
                                    Text(
                                      'про дресс-код',
                                      style: TextStyle(
                                        fontSize: 14,
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
                                  width: 19,
                                  height: 19,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Расскажите ему',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Style.red,
                                      ),
                                    ),
                                    Text(
                                      'про дресс-код',
                                      style: TextStyle(
                                        fontSize: 14,
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
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Был в бейджике',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Style.green,
                                  ),
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
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Был в бейджике',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Style.grey,
                                  ),
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
                                  width: 19,
                                  height: 19,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Спрашивал имя',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Style.grey,
                                      ),
                                    ),
                                    Text(
                                      'каждый раз',
                                      style: TextStyle(
                                        fontSize: 14,
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
                                  width: 19,
                                  height: 19,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Спрашивал имя',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Style.red,
                                      ),
                                    ),
                                    Text(
                                      'каждый раз',
                                      style: TextStyle(
                                        fontSize: 14,
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
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Лучший агент',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Style.green,
                                  ),
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
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Лучший агент',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Style.grey,
                                  ),
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
                                  width: 19,
                                  height: 19,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Ничего не знает',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Style.grey,
                                  ),
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
                                  width: 19,
                                  height: 19,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Ничего не знает',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Style.red,
                                  ),
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
                    pushNewScreen(context, screen: RateCallCenterScreen());
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
