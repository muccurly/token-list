import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultObjectBoxCopyWidget extends StatefulWidget {
  ResultObjectBoxCopyWidget({
    Key key,
    this.objectImg,
    this.houseName,
    this.rooms,
    this.floorAt,
    this.floorTotal,
    this.sqMeters,
    this.price,
  }) : super(key: key);

  final String objectImg;
  final String houseName;
  final int rooms;
  final int floorAt;
  final int floorTotal;
  final String sqMeters;
  final int price;

  @override
  _ResultObjectBoxCopyWidgetState createState() =>
      _ResultObjectBoxCopyWidgetState();
}

class _ResultObjectBoxCopyWidgetState extends State<ResultObjectBoxCopyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 350,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: 524,
      ),
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: widget.objectImg,
              width: MediaQuery.of(context).size.width,
              height: 240,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: AutoSizeText(
              widget.houseName,
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Roboto',
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Text(
              '${widget.rooms.toString()} комнатная  •   ${widget.floorAt.toString()} из ${widget.floorTotal.toString()}  •   ${widget.sqMeters} м',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Roboto',
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              '${widget.price.toString()} ₸',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.secondaryColor,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
