import 'package:flutter/material.dart';

import 'package:jurta/utils/utils.dart';
import 'package:flutter/services.dart';

class FormTile extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  final TextInputType keyboardType;
  final List<TextInputFormatter> textInputFormatters;

  const FormTile({
    Key key,
    this.controller,
    this.title,
    this.hintText,
    this.keyboardType,
    this.textInputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey.shade300, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// title
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              title ?? '--',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 8),

          /// form field
          TextFormField(
            controller: controller,
            inputFormatters: textInputFormatters,
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              fillColor: Colors.white,
              filled: true,
              hintText: hintText ?? '',
              hintStyle: TextStyle(
                color: Colors.grey.shade300,
                fontSize: 14,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 5,
              ),
              isDense: true,
            ),
            style: TextStyle(
              color: Style.orange,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            keyboardType: keyboardType ?? TextInputType.text,
          ),
        ],
      ),
    );
  }
}
