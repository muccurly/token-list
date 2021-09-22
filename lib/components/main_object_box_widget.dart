import '../components/show_more_box_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class MainObjectBoxWidget extends StatefulWidget {
  MainObjectBoxWidget({Key key}) : super(key: key);

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
                        'ЖК ПАРИЖСКИЙ КВАРТАЛ,',
                        style: GoogleFonts.getFont(
                          'Roboto',
                          color: FlutterFlowTheme.dark,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '70 000 000 ₸',
                        style: GoogleFonts.getFont(
                          'Roboto',
                          color: FlutterFlowTheme.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
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
            child: Text(
              '4-комнатный дом    •    2 этажа    •   148 м²',
              style: TextStyle(
                color: FlutterFlowTheme.dark,
                fontSize: 14,
              ),
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
                    'Нур-Султан, Есильский район,  Кошкарбаева 18/2',
                    style: GoogleFonts.getFont(
                      'Roboto',
                      color: FlutterFlowTheme.dark,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    ' Бизнес класс',
                    textAlign: TextAlign.end,
                    style: GoogleFonts.getFont(
                      'Roboto',
                      color: FlutterFlowTheme.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
            child: Text(
              'Количество комнат ................................. 7',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.grey,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
            child: Text(
              'Площадь  .................................................. 180 м',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.grey,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
            child: Text(
              'Этаж ........................................................ 2 из 5',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.grey,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
            child: Text(
              'Состояние ................................................ Евроремонт',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.grey,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
            child: Text(
              'Потолки ................................................... 3 м',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.grey,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
            child: Text(
              'Санузел ................................................... Раздельний',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.grey,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
            child: Text(
              'Паркинг ................................................... Парковка',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.grey,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
            child: Text(
              'Год постройки ......................................... 2014',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.grey,
                fontSize: 16,
              ),
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
                  style: GoogleFonts.getFont(
                    'Roboto',
                    color: FlutterFlowTheme.dark,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
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
                      style: GoogleFonts.getFont(
                        'Roboto',
                        color: FlutterFlowTheme.dark,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
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
                textStyle: FlutterFlowTheme.subtitle2.override(
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontSize: 16,
                ),
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
