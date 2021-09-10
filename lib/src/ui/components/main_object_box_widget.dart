import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jurta_app/src/data/entity/real_property.dart';
import 'package:share_plus/share_plus.dart';

import '../components/show_more_box_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class MainObjectBoxWidget extends StatefulWidget {
  MainObjectBoxWidget({
    Key? key,
    required this.realProperty,
  }) : super(key: key);

  final RealProperty realProperty;

  @override
  _MainObjectBoxWidgetState createState() => _MainObjectBoxWidgetState();
}

class _MainObjectBoxWidgetState extends State<MainObjectBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        '${widget.realProperty.residentialComplex ?? ''}',
                        style: FlutterFlowTheme.titleTextWDark.copyWith(),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${widget.realProperty.objectPrice} \u{3012}',
                        style: FlutterFlowTheme.titleTextWDark
                            .copyWith(color: FlutterFlowTheme.primaryColor),
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  await Share.share('https://www.jurta.kz/');
                },
                child: FaIcon(
                  FontAwesomeIcons.solidShareSquare,
                  color: FlutterFlowTheme.grey,
                  size: 18,
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Text('${widget.realProperty.numberOfRooms}-комнатный    '
                '${widget.realProperty.floor != null ? '•    ${widget.realProperty.floor} этаж    ' : ''}'
                '•   ${widget.realProperty.totalArea} м²',
              style: FlutterFlowTheme.subtitle2TextDark.copyWith(),
            ),
          ),
          Divider(
            height: 30,
            thickness: 2,
            color: Color(0xFFCBCBCB),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                      widget.realProperty.address.nameRu,
                    style: FlutterFlowTheme.subtitleTextDark.copyWith(),
                  ),
                ),
                Expanded(
                  child: Text(
                    ' Бизнес класс',
                    textAlign: TextAlign.end,
                    style: FlutterFlowTheme.subtitle2TextDark.copyWith(
                      color: FlutterFlowTheme.primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
            child: Text(
              'Количество комнат ................................. ${widget.realProperty.numberOfRooms}',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.bodyTextGrey.copyWith(),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
            child: Text(
              'Площадь  .................................................. ${widget.realProperty.totalArea} м²',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.bodyTextGrey.copyWith(),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
            child: Text(
              'Этаж ........................................................ ${widget.realProperty.floor}',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.bodyTextGrey.copyWith(),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
            child: Text(
              'Состояние ................................................ Евроремонт',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.bodyTextGrey.copyWith(),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
            child: Text(
              'Потолки ................................................... 3 м',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.bodyTextGrey.copyWith(),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
            child: Text(
              'Санузел ................................................... Раздельний',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.bodyTextGrey.copyWith(),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
            child: Text(
              'Паркинг ................................................... Парковка',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.bodyTextGrey.copyWith(),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
            child: Text(
              'Год постройки ......................................... 2014',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.bodyTextGrey.copyWith(),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Показать больше',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.subtitleTextDark.copyWith(),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: FlutterFlowTheme.dark,
                    size: 18,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Color(0xFFDADADA),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 15, 8, 15),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Посмотреть планировку объекта',
                      style: FlutterFlowTheme.subtitleTextDark.copyWith(),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Colors.black,
                      size: 24,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(3, 12, 3, 0),
            child: FFButtonWidget(
              onPressed: () {
                print('Button pressed ...');
              },
              text: 'Позвонить',
              options: FFButtonOptions(
                width: 130,
                height: 35,
                color: FlutterFlowTheme.primaryColor,
                textStyle: FlutterFlowTheme.btnTextWhite.copyWith(),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 16,
              ),
            ),
          ),
          ShowMoreBoxWidget()
        ],
      ),
    );
  }
}
