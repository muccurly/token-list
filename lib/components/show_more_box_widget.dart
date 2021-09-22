import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowMoreBoxWidget extends StatefulWidget {
  ShowMoreBoxWidget({Key key}) : super(key: key);

  @override
  _ShowMoreBoxWidgetState createState() => _ShowMoreBoxWidgetState();
}

class _ShowMoreBoxWidgetState extends State<ShowMoreBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Описание',
            style: GoogleFonts.getFont(
              'Roboto',
              color: FlutterFlowTheme.dark,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Text(
              'Расположен ЖК в престижном развивающемся районе. Рядом находится прекрасное место для отдыха и прогулок — Президентский парк, набережная реки Есиль. В шаговой доступности школа Haileybury Astana. В 10 минутах пешком Национальный музей, Дворец мира и согласия (Пирамида), Дворец независимости, казахский национальный университет',
              style: TextStyle(
                color: FlutterFlowTheme.dark,
                fontSize: 14,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Text(
                  'Школа',
                  style: GoogleFonts.getFont(
                    'Roboto',
                    color: FlutterFlowTheme.primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Text(
                  'Больница',
                  style: GoogleFonts.getFont(
                    'Roboto',
                    color: FlutterFlowTheme.dark,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Text(
                  'Детский сад',
                  style: GoogleFonts.getFont(
                    'Roboto',
                    color: FlutterFlowTheme.dark,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Text(
                  'ТРЦ',
                  style: GoogleFonts.getFont(
                    'Roboto',
                    color: FlutterFlowTheme.dark,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Школа-гимназия №75',
                  style: GoogleFonts.getFont(
                    'Roboto',
                    color: FlutterFlowTheme.dark,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Haileybury Astana',
                  style: GoogleFonts.getFont(
                    'Roboto',
                    color: FlutterFlowTheme.dark,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
            child: Text(
              'РЕЙТИНГ ЛОКАЛИЗАЦИИ',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.dark,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Рейтинг района',
                  style: GoogleFonts.getFont(
                    'Roboto',
                    color: FlutterFlowTheme.dark,
                    fontSize: 14,
                  ),
                ),
                Text(
                  '95%',
                  style: GoogleFonts.getFont(
                    'Roboto',
                    color: FlutterFlowTheme.dark,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 10,
            thickness: 2,
            color: Color(0xFFCBCBCB),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Рейтинг ЖК',
                style: GoogleFonts.getFont(
                  'Roboto',
                  color: FlutterFlowTheme.dark,
                  fontSize: 14,
                ),
              ),
              Text(
                '95%',
                style: GoogleFonts.getFont(
                  'Roboto',
                  color: FlutterFlowTheme.dark,
                  fontSize: 14,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
