import 'package:flutter/material.dart';
import 'package:jurta/screens/buyers.dart';

import 'package:jurta/utils/utils.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class RealtorFrilancerScreen extends StatefulWidget {
  static const String route = 'realtor_frilancer';
  @override
  _RealtorFrilancerScreenState createState() => _RealtorFrilancerScreenState();
}

class _RealtorFrilancerScreenState extends State<RealtorFrilancerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                bottom: 10, top: 100, left: 25, right: 25),
            child: Column(
              children: [
                //text
                Text(
                  'По вашему объекту у нас есть',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '4 покупателя',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Style.orange2),
                ),

                SizedBox(
                  height: 120,
                ),

                ///houses rieltor imag
                Image.asset(
                  'assets/images/houses_rieltor.png',
                ),
                SizedBox(
                  height: 140,
                ),

                /// оставить заявку кнопка
                Container(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      pushNewScreen(context, screen: Buyers());
                    },
                    child: Text(
                      '       ПОСМОТРЕТЬ      ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Style.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
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
