import 'package:flutter/material.dart';
import 'package:jurta/utils/global.dart';

class RieltorFrilancer3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //text
              Text(
                'Ваша публикация находится',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              Text(
                ' на модерации',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Ваш персональный менеджер',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
              Text(
                'скоро свяжется с вами',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 350,
                  maxWidth: 350,
                ),
                child: Image.asset(
                  'assets/images/call_center_bro.png',
                  height: Global.getSize(context).width / 1.15,
                  width: Global.getSize(context).width / 1.15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
