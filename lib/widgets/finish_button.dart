import 'package:flutter/material.dart';
import 'package:jurta/utils/style.dart';

class FinishButton extends StatelessWidget {
  final Function func;

  const FinishButton({Key key, this.func}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: SizedBox(
        height: 38,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 38,
                width: 210,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Style.orange,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 38,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Style.blue,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Завершить",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
