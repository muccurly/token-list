import '../advance_search_page/advance_search_page_widget.dart';
import '../components/small_info_box_widget.dart';
import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../object_info_page/object_info_page_widget.dart';
import '../search_result_page/search_result_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPageWidget extends StatefulWidget {
  SearchPageWidget({Key key}) : super(key: key);

  @override
  _SearchPageWidgetState createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  String dropDownValue;
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  TextEditingController textController4;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.tertiaryColor,
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(8, 50, 0, 0),
                child: InkWell(
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.black,
                        size: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                        child: Text(
                          'Назад',
                          style: GoogleFonts.getFont(
                            'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                    child: Text(
                      'ТИП НЕДВИЖИМОСТИ',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: FlutterFlowDropDown(
                      options:
                          ['Квартиры', 'Дома', 'Офисные помещение'].toList(),
                      onChanged: (value) {
                        setState(() => dropDownValue = value);
                      },
                      width: 130,
                      height: 48,
                      textStyle: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 16,
                      ),
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        size: 15,
                      ),
                      fillColor: Colors.white,
                      elevation: 1,
                      borderColor: Color(0xFFBEBEBE),
                      borderWidth: 1,
                      borderRadius: 8,
                      margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                      hidesUnderline: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                    child: Text(
                      'КОМНАТНОСТЬ',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: 30,
                              height: 40,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.primaryColor,
                              ),
                              child: Align(
                                alignment: Alignment(0, 0),
                                child: Text(
                                  '1',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 30,
                              height: 40,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.white,
                              ),
                              child: Align(
                                alignment: Alignment(0, 0),
                                child: Text(
                                  '2',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.secondaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 30,
                              height: 40,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.primaryColor,
                              ),
                              child: Align(
                                alignment: Alignment(0, 0),
                                child: Text(
                                  '3',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 30,
                              height: 40,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.primaryColor,
                              ),
                              child: Align(
                                alignment: Alignment(0, 0),
                                child: Text(
                                  '4',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 30,
                              height: 40,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.primaryColor,
                              ),
                              child: Align(
                                alignment: Alignment(0, 0),
                                child: Text(
                                  '5+',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                    child: Text(
                      'ДИАПАЗОН ЦЕН, ₸',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                            child: TextFormField(
                              controller: textController1,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'от',
                                hintStyle: TextStyle(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.white,
                              ),
                              style: TextStyle(
                                color: FlutterFlowTheme.secondaryColor,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                            child: TextFormField(
                              controller: textController2,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'до',
                                hintStyle: TextStyle(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.white,
                              ),
                              style: TextStyle(
                                color: FlutterFlowTheme.secondaryColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                    child: Text(
                      'ПЛОЩАДЬ, М',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                            child: TextFormField(
                              controller: textController3,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'от',
                                hintStyle: TextStyle(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.white,
                              ),
                              style: TextStyle(
                                color: FlutterFlowTheme.secondaryColor,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                            child: TextFormField(
                              controller: textController4,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'до',
                                hintStyle: TextStyle(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.white,
                              ),
                              style: TextStyle(
                                color: FlutterFlowTheme.secondaryColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 300),
                            reverseDuration: Duration(milliseconds: 300),
                            child: AdvanceSearchPageWidget(),
                          ),
                        );
                      },
                      child: Text(
                        'РАСШИРЕННЫЙ ПОИСК',
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: 'Сбросить',
                          options: FFButtonOptions(
                            width: 170,
                            height: 48,
                            color: FlutterFlowTheme.secondaryColor,
                            textStyle: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 8,
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 300),
                                reverseDuration: Duration(milliseconds: 300),
                                child: SearchResultPageWidget(),
                              ),
                            );
                          },
                          text: 'ПРИМЕНИТЬ',
                          options: FFButtonOptions(
                            width: 170,
                            height: 48,
                            color: FlutterFlowTheme.primaryColor,
                            textStyle: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 8,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 12, 0, 8),
              child: Text(
                'ГОРЯЩИЕ',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
                          child: ObjectInfoPageWidget(),
                        ),
                      );
                    },
                    child: SmallInfoBoxWidget(),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 12, 0, 8),
              child: Text(
                'ГОРЯЩИЕ',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [SmallInfoBoxWidget()],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
