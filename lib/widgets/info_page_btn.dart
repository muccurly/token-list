import 'package:flutter/material.dart';

class InfoPageBtn extends StatelessWidget {
  Function function;
  String text;
  InfoPageBtn({this.text, this.function});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      highlightColor: Colors.white,
      onTap: function,
      child: Container(
        height: 48,
        width: double.infinity,
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 0.66,
            color: Colors.grey.shade300,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text ?? ' - -',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Color(0xFF333333),
            ),
          ],
        ),
      ),
    );
  }
}
