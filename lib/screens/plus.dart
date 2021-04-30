import 'package:flutter/material.dart';
import 'package:jurta/screens/our_specialists.dart';
import 'package:jurta/screens/screens.dart';
import 'package:jurta/utils/utils.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class PlusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF0F0F0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              // padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 100),
              mainAxisSize: MainAxisSize.min,
              children: [
                /// owner
                OptionWidget(
                  image: 'assets/images/select_house_pana.png',
                  text: 'ПРОДАТЬ САМОМУ',
                  color: Style.orange,
                  onPressed: () {
                    pushNewScreen(context, screen: PlusIntoductionScreen());
                  },
                ),
                const SizedBox(height: 32),

                /// help to sell
                OptionWidget(
                  image: 'assets/images/relaxing_at_home_pana.png',
                  text: 'ПРОДАТЬ\nЧЕРЕЗ РИЭЛТОРА',
                  color: Style.blue,
                  onPressed: () {
                    pushNewScreen(context, screen: OurSpeicalistsScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Hero(
        tag: 'PLUS_BUTTON',
        child: PlusButton(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class PlusButton extends StatelessWidget {
  const PlusButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: SizedBox(
        height: 32,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 32,
                width: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Style.orange,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 32,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Style.blue,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OptionWidget extends StatelessWidget {
  final String image;
  final String text;
  final Color color;
  final Function onPressed;

  const OptionWidget({
    Key key,
    this.image,
    this.text,
    this.color,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Row(
            children: [
              const SizedBox(width: 8),
              Expanded(
                child: Image.asset(
                  image ?? '',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 25),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      text ?? '',
                      style: TextStyle(
                        color: color ?? Style.orange,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      width: Global.getSize(context).width,
                      margin: const EdgeInsets.only(top: 16),
                      child: ElevatedButton(
                        onPressed: onPressed ?? () {},
                        child: Text(
                          'Выбрать',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: color ?? Style.orange,
                          elevation: 0,
                          padding: const EdgeInsets.only(top: 2.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 30),
            ],
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
