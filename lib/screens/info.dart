import 'package:flutter/material.dart';
import 'package:jurta/screens/about_app.dart';
import 'package:jurta/screens/screens.dart';
import 'package:jurta/widgets/info_page_btn.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                    'ИНФОРМАЦИЯ',
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
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        margin: const EdgeInsets.only(bottom: 12),
        child: Column(
          children: [
            InfoPageBtn(
              function: () {
                pushNewScreen(
                  context,
                  screen: UpdateScreen(),
                );
              },
              text: "Обновления приложения",
            ),
            InfoPageBtn(
              function: () {
                pushNewScreen(
                  context,
                  screen: AboutAppScreen(),
                );
              },
              text: "О приложении",
            ),
            InfoPageBtn(
              function: () {
                pushNewScreen(
                  context,
                  screen: ContactUsScreen(),
                );
              },
              text: "Связаться с нами",
            ),
          ],
        ),
      ),
    );
  }
}
