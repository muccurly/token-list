import 'package:flutter/material.dart';
import 'package:jurta/utils/utils.dart';

class RulesCheckbox extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool switchValue;

  final Function(bool val) onChanged;

  const RulesCheckbox({
    Key key,
    this.title,
    this.subtitle,
    this.switchValue,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!switchValue);
      },
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// title
                Text(
                  title ?? '--',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                /// subtitle
                if (subtitle != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      subtitle ?? '--',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Transform.scale(
            scale: 0.75,
            child: Switch(
              value: switchValue,
              onChanged: (val) => onChanged(val),
              activeColor: Style.orange,
              inactiveThumbColor: Style.blue,
            ),
          ),
        ],
      ),
    );
  }
}
