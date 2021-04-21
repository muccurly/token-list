import 'package:flutter/material.dart';
import 'package:jurta/screens/screens.dart';
import 'package:jurta/utils/utils.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class PlusIntoductionScreen extends StatefulWidget {
  @override
  _PlusIntoductionScreenState createState() => _PlusIntoductionScreenState();
}

class _PlusIntoductionScreenState extends State<PlusIntoductionScreen> {
  bool _notShowMore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/woman.png',
              fit: BoxFit.cover,
            ),
          ),

          ///
          Positioned(
            bottom: Global.getViewPadding(context).bottom + 16,
            left: 16,
            right: 16,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                /// do not show more
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() => _notShowMore = !_notShowMore);
                    },
                    child: Row(
                      children: [
                        Theme(
                          data: Theme.of(context).copyWith(
                            unselectedWidgetColor: Colors.white,
                          ),
                          child: Checkbox(
                            value: _notShowMore,
                            onChanged: (val) =>
                                setState(() => _notShowMore = val),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Больше\nне показывать',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        /* CheckboxListTile(
                          value: _notShowMore,
                          onChanged: (val) =>
                              setState(() => _notShowMore = !_notShowMore),
                          title: Text(
                            'Больше\nне показывать',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          checkColor: Colors.white,
                        ), */
                      ],
                    ),
                  ),
                ),

                /// buttons
                Expanded(
                  child: Column(
                    children: [
                      /// video instruction
                      Container(
                        height: 40,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: FittedBox(
                            child: Text(
                              'Видеоинструкция',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey.shade300,
                            elevation: 0,
                            padding: const EdgeInsets.only(top: 2.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),

                      /// start
                      Container(
                        height: 60,
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 16),
                        child: ElevatedButton(
                          onPressed: () {
                            pushNewScreen(context, screen: OwnerScreen());
                          },
                          child: FittedBox(
                            child: Text(
                              'НАЧАТЬ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Style.orange,
                            elevation: 0,
                            padding: const EdgeInsets.only(top: 2.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
