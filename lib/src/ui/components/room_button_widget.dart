import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jurta_app/src/business_logic/filter/filter.dart';
=======
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_theme.dart';

class RoomButton extends StatelessWidget {
  const RoomButton({
    Key? key,
    required this.text,
    this.borderRadius,
    this.isActive = false,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final BorderRadius? borderRadius;
  final bool isActive;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 30,
        height: 40,
        decoration: BoxDecoration(
          color:
              isActive ? FlutterFlowTheme.primaryColor : FlutterFlowTheme.white,
          borderRadius: borderRadius,
        ),
        child: Center(
          child: Text(
            text,
            style: FlutterFlowTheme.btnTextWhite.copyWith(
              color: isActive
                  ? FlutterFlowTheme.white
                  : FlutterFlowTheme.secondaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
