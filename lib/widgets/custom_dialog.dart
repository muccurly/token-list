import 'package:flutter/material.dart';
import 'package:jurta/utils/utils.dart';

class CustomDialog extends StatelessWidget {
  final BuildContext ctx; // dialog context (to close dialog)
  final String imagePath;
  final Widget content;
  final Widget title;
  final String buttonText;
  final String buttonText2;
  final Color buttonTextColor;
  final Color buttonTextColor2;
  final Color buttonColor;
  final Color buttonColor2;
  final bool buttonDisable;
  final bool buttonRemove;
  final bool buttonRound;
  final Function(BuildContext ctx) contentWidget;

  const CustomDialog({
    Key key,
    this.ctx,
    this.imagePath,
    this.content,
    this.title,
    this.buttonText,
    this.buttonText2,
    this.buttonTextColor,
    this.buttonTextColor2,
    this.buttonColor,
    this.buttonColor2,
    this.buttonDisable,
    this.buttonRemove,
    this.buttonRound,
    this.contentWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: Global.getSize(context).width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null) const SizedBox(height: 16),
            if (title != null) title,
            if (title != null) const SizedBox(height: 16),

            /// image or contentWidget
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: Global.getSize(context).width * 1.5,
                maxWidth: Global.getSize(context).width,
              ),
              child: contentWidget != null
                  ? contentWidget(ctx)
                  : Image.asset(
                      imagePath ?? 'assets/images/enthusiastic_pana.png',
                      // height: Global.getSize(context).width / 1.5,
                      width: Global.getSize(context).width / 1.5,
                      fit: BoxFit.fitWidth,
                    ),
            ),
            const SizedBox(height: 16),

            /// content
            if (content != null) content,
            if (content != null) const SizedBox(height: 16),

            /// button
            if (!buttonRemove)
              Container(
                width: Global.getSize(context).width,
                child: ElevatedButton(
                  onPressed: buttonDisable ? null : () => Navigator.pop(ctx),
                  child: Text(
                    buttonText ?? '',
                    style: TextStyle(
                      color: buttonTextColor ?? Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: buttonColor ?? Style.orange,
                    elevation: 0,
                    padding: const EdgeInsets.only(top: 2.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(buttonRound ? 50 : 7),
                    ),
                  ),
                ),
              ),

            /// button 2
            if (!buttonRemove && buttonText2 != null)
              Container(
                width: Global.getSize(context).width,
                child: ElevatedButton(
                  onPressed: buttonDisable ? null : () => Navigator.pop(ctx),
                  child: Text(
                    buttonText2 ?? '',
                    style: TextStyle(
                      color: buttonTextColor2 ?? Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: buttonColor2 ?? Style.blue,
                    elevation: 0,
                    padding: const EdgeInsets.only(top: 2.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(buttonRound ? 50 : 7),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      insetPadding: const EdgeInsets.all(16),
    );
  }
}

void showCustomDialog(
  BuildContext context, {
  String imagePath,
  Widget content,
  Widget title,
  String buttonText,
  String buttonText2,
  Color buttonTextColor,
  Color buttonTextColor2,
  Color buttonColor,
  Color buttonColor2,
  bool buttonDisable = false,
  bool buttonRemove = false,
  Function(BuildContext ctx) contentWidget,
  bool barrierDismissible,
  bool buttonRound = false,
}) {
  assert(contentWidget != null || imagePath != null);

  showDialog(
    context: context,
    barrierDismissible: barrierDismissible ?? true,
    builder: (c) {
      return CustomDialog(
        ctx: c,
        imagePath: imagePath,
        content: content,
        title: title,
        buttonText: buttonText,
        buttonText2: buttonText2,
        buttonTextColor: buttonTextColor,
        buttonTextColor2: buttonTextColor2,
        buttonColor: buttonColor,
        buttonColor2: buttonColor2,
        buttonDisable: buttonDisable,
        contentWidget: contentWidget,
        buttonRound: buttonRound,
        buttonRemove: buttonRemove,
      );
    },
  );
}
