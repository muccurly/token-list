import 'package:flutter/material.dart';
import 'package:jurta/screens/screens.dart';
import 'package:jurta/utils/helper.dart';

class ContactUsScreen extends StatelessWidget {
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.arrow_back_rounded, size: 20),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0, left: 4.0),
                    child: Text(
                      'СВЯЗАТЬСЯ С НАМИ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          leading: null,
          titleSpacing: 0,
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InfoCard(
                iconPath: 'assets/images/phone_small.svg',
                fieldText: 'Call-center:',
                fieldTextColor: const Color.fromRGBO(219, 219, 219, 1.0),
                backgroundColor: const Color.fromRGBO(74, 80, 86, 1),
                descriptionText: '+7 700 999 96 96',
                descriptionTextColor: Colors.white,
                iconSpacer: Container(
                  height: 16,
                  width: 1,
                  color: const Color.fromRGBO(238, 238, 238, 1.0),
                ),
                onTap: () => launchUrl('tel:+77009999696'),
              ),
              InfoCard(
                iconPath: 'assets/images/call_small.svg',
                fieldText: 'Центр поддержки клиентов:',
                fieldTextColor: const Color.fromRGBO(219, 219, 219, 1.0),
                backgroundColor: const Color.fromRGBO(74, 80, 86, 1),
                descriptionText: '+7 700 999 96 96',
                descriptionTextColor: Colors.white,
                iconSpacer: Container(
                  height: 16,
                  width: 1,
                  color: const Color.fromRGBO(238, 238, 238, 1.0),
                ),
                onTap: () => launchUrl('tel:+77009999696'),
              )
            ],
          ),
        ));
  }
}
