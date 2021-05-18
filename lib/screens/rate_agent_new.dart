import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:jurta/screens/screens.dart';

import 'package:jurta/utils/utils.dart';
import 'package:jurta/widgets/finish_button.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class RateAgentNewScreen extends StatefulWidget {
  static const String route = 'rate_agent';

  @override
  _RateAgentNewScreenState createState() => _RateAgentNewScreenState();
}

class _RateAgentNewScreenState extends State<RateAgentNewScreen> {
  bool buttonGroup1 = false;
  bool buttonGroup2 = false;
  bool buttonGroup3 = false;
  bool buttonGroup4 = false;
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///ButtonGroup 1
                    GestureDetector(
                      child: RatingAgentWidget(
                        text: 'Полезные \nподборки',
                        imageUrl:
                            'assets/images/rate_agent_icon/polezn_podborki.png',
                        isChecked: buttonGroup1,
                      ),
                      onTap: () {
                        setState(() {
                          buttonGroup1 = !buttonGroup1;
                        });
                      },
                    ),
                    SizedBox(
                      width: Global.getSize(context).width * 0.05,
                    ),

                    ///ButtonGroup 2
                    GestureDetector(
                      child: RatingAgentWidget(
                        text: 'Выгодная \nпродажа',
                        imageUrl:
                            'assets/images/rate_agent_icon/vigod_prodazha.png',
                        isChecked: buttonGroup2,
                      ),
                      onTap: () {
                        setState(() {
                          buttonGroup2 = !buttonGroup2;
                        });
                      },
                    ),
                    SizedBox(
                      width: Global.getSize(context).width * 0.03,
                    ),

                    ///ButtonGroup 3
                    GestureDetector(
                      child: RatingAgentWidget(
                        text: 'Дружелюбный \nэксперт',
                        imageUrl:
                            'assets/images/rate_agent_icon/friendly_expert.png',
                        isChecked: buttonGroup3,
                      ),
                      onTap: () {
                        setState(() {
                          buttonGroup3 = !buttonGroup3;
                        });
                      },
                    ),
                    SizedBox(
                      width: Global.getSize(context).width * 0.01,
                    ),

                    ///ButtonGroup 4
                    GestureDetector(
                      child: RatingAgentWidget(
                        text: 'Идеальное\nсопровождение',
                        imageUrl: 'assets/images/rate_agent_icon/ideal.png',
                        isChecked: buttonGroup4,
                      ),
                      onTap: () {
                        setState(() {
                          buttonGroup4 = !buttonGroup4;
                        });
                      },
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

class RatingAgentWidget extends StatelessWidget {
  String text;
  bool isChecked;
  String imageUrl;
  RatingAgentWidget({this.text, this.imageUrl, this.isChecked = false});
  @override
  Widget build(BuildContext context) {
    return !isChecked
        ? Column(
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/rate_agent_icon/checkedFalse.svg',
                width: 18,
                height: 18,
              ),
              SizedBox(
                height: 12,
              ),
              Image.asset(
                imageUrl ?? 'assets/images/rate_agent_icon/polezn_podborki.png',
                width: 55,
                height: 55,
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                text ?? 'Полезные \nподборки',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              )
            ],
          )
        : Column(
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/rate_agent_icon/checkedTrue.svg',
                width: 18,
                height: 18,
              ),
              SizedBox(
                height: 12,
              ),
              Image.asset(
                imageUrl ?? 'assets/images/rate_agent_icon/polezn_podborki.png',
                width: 55,
                height: 55,
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                text ?? 'Полезные \nподборки',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Style.orange,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              )
            ],
          );
  }
}
