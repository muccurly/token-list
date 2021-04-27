import 'package:flutter/material.dart';

import 'package:jurta/screens/screens.dart';
import 'package:jurta/utils/utils.dart';

class OwnerScreen extends StatefulWidget {
  static const String route = 'owner';
  @override
  _OwnerScreenState createState() => _OwnerScreenState();
}

class _OwnerScreenState extends State<OwnerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 10, top: 50, left: 25, right: 25),
            child: Column(
              children: [
                //text

                Text(
                  'Ура! Ура! Ура!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Style.orange2),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Ваш обзор опубликован',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),

                ///review accept
                Image.asset(
                  'assets/images/accept.png',
                  width: 64,
                  height: 64,
                ),
                SizedBox(
                  height: 80,
                ),

                ///review accept 2
                Container(
                  constraints: BoxConstraints.expand(
                      height: MediaQuery.of(context).size.height / 3),
                  child: Image.asset(
                    'assets/images/owner_accept_review.png',
                  ),
                ),
                SizedBox(
                  height: Global.getSize(context).height / 9,
                ),

                /// оставить заявку кнопка
                Container(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      //pushNewScreen(context, screen: RealtorFrilancerScreen());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RealtorFrilancerScreen(),
                          ));
                    },
                    child: Text(
                      'Посмотреть обзор',
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
