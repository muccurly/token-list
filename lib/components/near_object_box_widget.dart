import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NearObjectBoxWidget extends StatefulWidget {
  NearObjectBoxWidget({
    Key key,
    this.type,
    this.name,
    this.address,
  }) : super(key: key);

  final String type;
  final String name;
  final String address;

  @override
  _NearObjectBoxWidgetState createState() => _NearObjectBoxWidgetState();
}

class _NearObjectBoxWidgetState extends State<NearObjectBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.name,
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              widget.address,
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
      ),
    );
  }
}
