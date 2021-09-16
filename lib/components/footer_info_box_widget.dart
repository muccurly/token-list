import '../components/result_object_box_copy_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterInfoBoxWidget extends StatefulWidget {
  FooterInfoBoxWidget({
    Key key,
    this.totalComments,
  }) : super(key: key);

  final int totalComments;

  @override
  _FooterInfoBoxWidgetState createState() => _FooterInfoBoxWidgetState();
}

class _FooterInfoBoxWidgetState extends State<FooterInfoBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ПОХОЖИЕ ОБЪЕКТЫ',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Roboto',
                    color: FlutterFlowTheme.dark,
                    fontSize: 18,
                  ),
                ),
                Container(
                  width: 70,
                  height: 30,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '153',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Roboto',
                            color: FlutterFlowTheme.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: FlutterFlowTheme.white,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: ResultObjectBoxCopyWidget(
                  objectImg:
                      'https://polinov.ru/upload/resize_cache/iblock/a41/572_800_1/a41383ca0574502d6c4ee53bea3c04b7.jpg',
                  houseName: 'ЖК Комфорт',
                  rooms: 5,
                  floorAt: 2,
                  floorTotal: 3,
                  sqMeters: '150',
                  price: 200000,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
