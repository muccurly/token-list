import 'package:flutter/material.dart';

import '../flutter_flow/flutter_flow_theme.dart';

class ShowMoreBoxWidget extends StatefulWidget {
  ShowMoreBoxWidget({Key? key}) : super(key: key);

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
            style: FlutterFlowTheme.subtitleTextDark.copyWith(),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Text(
              'Расположен ЖК в престижном развивающемся районе. Рядом находится прекрасное место для отдыха и прогулок — Президентский парк, набережная реки Есиль. В шаговой доступности школа Haileybury Astana. В 10 минутах пешком Национальный музей, Дворец мира и согласия (Пирамида), Дворец независимости, казахский национальный университет',
              style: FlutterFlowTheme.bodyTextDark.copyWith(),
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
                  style: FlutterFlowTheme.subtitleTextDark.copyWith(),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Text(
                  'Больница',
                  style: FlutterFlowTheme.subtitleTextDark.copyWith(),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Text(
                  'Детский сад',
                  style: FlutterFlowTheme.subtitleTextDark.copyWith(),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Text(
                  'ТРЦ',
                  style: FlutterFlowTheme.subtitleTextDark.copyWith(),
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
                  style: FlutterFlowTheme.bodyTextGrey.copyWith(),
                ),
                Text(
                  'Haileybury Astana',
                  style: FlutterFlowTheme.bodyTextGrey.copyWith(),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
            child: Text(
              'РЕЙТИНГ ЛОКАЛИЗАЦИИ',
              style: FlutterFlowTheme.subtitleTextDark.copyWith(),
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
                  style: FlutterFlowTheme.bodyTextDark.copyWith(),
                ),
                Text(
                  '95%',
                  style: FlutterFlowTheme.bodyTextDark.copyWith(),
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
                style: FlutterFlowTheme.bodyTextDark.copyWith(),
              ),
              Text(
                '95%',
                style: FlutterFlowTheme.bodyTextDark.copyWith(),
              )
            ],
          )
        ],
      ),
    );
  }
}
