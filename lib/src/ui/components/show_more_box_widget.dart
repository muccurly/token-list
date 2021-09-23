import 'package:flutter/material.dart';
import 'package:jurta_app/src/data/entity/application_client_view.dart';

import '../flutter_flow/flutter_flow_theme.dart';

class ShowMoreBoxWidget extends StatefulWidget {
  ShowMoreBoxWidget({Key? key, required this.apv}) : super(key: key);

  final ApplicationClientView apv;

  @override
  _ShowMoreBoxWidgetState createState() => _ShowMoreBoxWidgetState();
}

class _ShowMoreBoxWidgetState extends State<ShowMoreBoxWidget> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    var description = widget.apv.sellDataDto.description;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Описание',
            style: FlutterFlowTheme.subtitleTextDark.copyWith(),
          ),
          description != null
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Text(
                    description,
                    style: FlutterFlowTheme.bodyTextDark.copyWith(),
                  ),
                )
              : const SizedBox.shrink(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _index = 0;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                  child: Text(
                    'Школа',
                    style: FlutterFlowTheme.subtitleTextDark.copyWith(
                      color: _index == 0
                          ? Colors.deepOrangeAccent
                          : Color(0xFF333333),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _index = 1;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                  child: Text(
                    'Больница',
                    style: FlutterFlowTheme.subtitleTextDark.copyWith(
                      color: _index == 1
                          ? Colors.deepOrangeAccent
                          : Color(0xFF333333),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _index = 2;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                  child: Text(
                    'Детский сад',
                    style: FlutterFlowTheme.subtitleTextDark.copyWith(
                      color: _index == 2
                          ? Colors.deepOrangeAccent
                          : Color(0xFF333333),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _index = 3;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                  child: Text(
                    'ТРЦ',
                    style: FlutterFlowTheme.subtitleTextDark.copyWith(
                      color: _index == 3
                          ? Colors.deepOrangeAccent
                          : Color(0xFF333333),
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
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
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
            child: Text(
              'РЕЙТИНГ ЛОКАЛИЗАЦИИ',
              style: FlutterFlowTheme.subtitleTextDark.copyWith(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
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
