import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import '../search_result_page/search_result_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdvanceSearchPageWidget extends StatefulWidget {
  AdvanceSearchPageWidget({Key? key}) : super(key: key);

  @override
  _AdvanceSearchPageWidgetState createState() =>
      _AdvanceSearchPageWidgetState();
}

class _AdvanceSearchPageWidgetState extends State<AdvanceSearchPageWidget> {
  String? dropDownValue1;
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  TextEditingController textController3 = TextEditingController();
  TextEditingController textController4 = TextEditingController();
  TextEditingController textController5 = TextEditingController();
  TextEditingController textController6 = TextEditingController();
  TextEditingController textController7 = TextEditingController();
  String? dropDownValue2;
  TextEditingController textController8 = TextEditingController();
  TextEditingController textController9 = TextEditingController();
  bool? switchListTileValue1;
  bool? switchListTileValue2;
  bool? switchListTileValue3;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int room_1 = 1;
  int room_2 = 1;
  int room_3 = 1;
  int room_4 = 1;
  int room_more_5 = 1;

  int any = 1;
  int studio = 1;
  int isolated_rooms = 1;

  // @override
  // void initState() {
  //   super.initState();
  //   textController1 = TextEditingController();
  //   textController2 = TextEditingController();
  //   textController3 = TextEditingController();
  //   textController4 = TextEditingController();
  //   textController5 = TextEditingController();
  //   textController6 = TextEditingController();
  //   textController7 = TextEditingController();
  //   textController8 = TextEditingController();
  //   textController9 = TextEditingController();
  // }

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
                      style: FlutterFlowTheme.searchPageTitle.copyWith(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: FlutterFlowDropDown(
                      options:
                          ['Квартиры', 'Дома', 'Офисные помещение'].toList(),
                      onChanged: (value) {
                        setState(() => dropDownValue1 = value);
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
                      borderColor: FlutterFlowTheme.tertiaryColor,
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
                      style: FlutterFlowTheme.searchPageTitle.copyWith(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  room_1 = 0;
                                });
                              },
                              child: Container(
                                width: 30,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: room_1 == 0
                                      ? FlutterFlowTheme.primaryColor
                                      : FlutterFlowTheme.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(0),
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment(0, 0),
                                  child: Text(
                                    '1',
                                    style:
                                        FlutterFlowTheme.btnTextWhite.copyWith(
                                      color: room_1 == 0
                                          ? FlutterFlowTheme.white
                                          : FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  room_2 = 0;
                                });
                              },
                              child: Container(
                                width: 30,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: room_2 == 0
                                      ? FlutterFlowTheme.primaryColor
                                      : FlutterFlowTheme.white,
                                ),
                                child: Align(
                                  alignment: Alignment(0, 0),
                                  child: Text(
                                    '2',
                                    style:
                                        FlutterFlowTheme.btnTextWhite.copyWith(
                                      color: room_2 == 0
                                          ? FlutterFlowTheme.white
                                          : FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  room_3 = 0;
                                });
                              },
                              child: Container(
                                width: 30,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: room_3 == 0
                                      ? FlutterFlowTheme.primaryColor
                                      : FlutterFlowTheme.white,
                                ),
                                child: Align(
                                  alignment: Alignment(0, 0),
                                  child: Text(
                                    '3',
                                    style:
                                        FlutterFlowTheme.btnTextWhite.copyWith(
                                      color: room_3 == 0
                                          ? FlutterFlowTheme.white
                                          : FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  room_4 = 0;
                                });
                              },
                              child: Container(
                                width: 30,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: room_4 == 0
                                      ? FlutterFlowTheme.primaryColor
                                      : FlutterFlowTheme.white,
                                ),
                                child: Align(
                                  alignment: Alignment(0, 0),
                                  child: Text(
                                    '4',
                                    style:
                                        FlutterFlowTheme.btnTextWhite.copyWith(
                                      color: room_4 == 0
                                          ? FlutterFlowTheme.white
                                          : FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  room_more_5 = 0;
                                });
                              },
                              child: Container(
                                width: 30,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: room_more_5 == 0
                                      ? FlutterFlowTheme.primaryColor
                                      : FlutterFlowTheme.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(8),
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(8),
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment(0, 0),
                                  child: Text(
                                    '5+',
                                    style:
                                        FlutterFlowTheme.btnTextWhite.copyWith(
                                      color: room_more_5 == 0
                                          ? FlutterFlowTheme.white
                                          : FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                    child: Text(
                      'ДИАПАЗОН ЦЕН, ₸',
                      style: FlutterFlowTheme.searchPageTitle.copyWith(),
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
                                hintStyle:
                                    FlutterFlowTheme.hintStyle.copyWith(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.tertiaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.tertiaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.white,
                              ),
                              style: TextStyle(
                                color: FlutterFlowTheme.secondaryColor,
                                fontSize: 16,
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
                                hintStyle:
                                    FlutterFlowTheme.hintStyle.copyWith(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.tertiaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.tertiaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.white,
                              ),
                              style: TextStyle(
                                color: FlutterFlowTheme.secondaryColor,
                                fontSize: 16,
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
                      style: FlutterFlowTheme.searchPageTitle.copyWith(),
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
                                hintStyle:
                                    FlutterFlowTheme.hintStyle.copyWith(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.tertiaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.tertiaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.white,
                              ),
                              style: TextStyle(
                                color: FlutterFlowTheme.secondaryColor,
                                fontSize: 16,
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
                                hintStyle:
                                    FlutterFlowTheme.hintStyle.copyWith(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.tertiaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.tertiaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.white,
                              ),
                              style: TextStyle(
                                color: FlutterFlowTheme.secondaryColor,
                                fontSize: 16,
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
                      'МЕСТОПОЛОЖЕНИЕ',
                      style: FlutterFlowTheme.searchPageTitle.copyWith(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: TextFormField(
                      controller: textController5,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'Район',
                        hintStyle: FlutterFlowTheme.hintStyle.copyWith(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.tertiaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.tertiaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.white,
                      ),
                      style: TextStyle(
                        color: FlutterFlowTheme.secondaryColor,
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
                              controller: textController6,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'Улица',
                                hintStyle:
                                    FlutterFlowTheme.hintStyle.copyWith(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.tertiaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.tertiaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.white,
                              ),
                              style: TextStyle(
                                color: FlutterFlowTheme.secondaryColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                            child: TextFormField(
                              controller: textController7,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'Жилой комплекс',
                                hintStyle:
                                    FlutterFlowTheme.hintStyle.copyWith(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.tertiaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.tertiaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.white,
                              ),
                              style: TextStyle(
                                color: FlutterFlowTheme.secondaryColor,
                                fontSize: 16,
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
                      'ПЛАНИРОВКА',
                      style: FlutterFlowTheme.searchPageTitle.copyWith(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.primaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 17, 0, 17),
                              child: Text(
                                'Любая',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: FlutterFlowTheme.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: Text(
                                'Изолированные\nкомнаты',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  color: FlutterFlowTheme.dark,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 19, 0, 19),
                              child: Text(
                                'Студия',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  color: FlutterFlowTheme.dark,
                                  fontWeight: FontWeight.w500,
                                ),
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
                      'ПЛАНИРОВКА',
                      style: FlutterFlowTheme.searchPageTitle.copyWith(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: FlutterFlowDropDown(
                      options: ['Дизайнерский ремонт'].toList(),
                      onChanged: (value) {
                        setState(() => dropDownValue2 = value);
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
                      borderColor: FlutterFlowTheme.tertiaryColor,
                      borderWidth: 1,
                      borderRadius: 8,
                      margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                      hidesUnderline: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                    child: Text(
                      'ГОД ПОСТРОЙКИ',
                      style: FlutterFlowTheme.searchPageTitle.copyWith(),
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
                              controller: textController8,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'от',
                                hintStyle:
                                    FlutterFlowTheme.hintStyle.copyWith(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.tertiaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.tertiaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.white,
                              ),
                              style: TextStyle(
                                color: FlutterFlowTheme.secondaryColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                            child: TextFormField(
                              controller: textController9,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'до',
                                hintStyle:
                                    FlutterFlowTheme.hintStyle.copyWith(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.tertiaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.tertiaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.white,
                              ),
                              style: TextStyle(
                                color: FlutterFlowTheme.secondaryColor,
                                fontSize: 16,
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
                      'ПОКАЗЫВАТЬ ТОЛЬКО',
                      style: FlutterFlowTheme.searchPageTitle.copyWith(),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SwitchListTile(
                      value: switchListTileValue1 ??= true,
                      onChanged: (newValue) =>
                          setState(() => switchListTileValue1 = newValue),
                      title: Text(
                        'Есть торг',
                        style: FlutterFlowTheme.darkNormal16.copyWith(),
                      ),
                      tileColor: FlutterFlowTheme.white,
                      activeColor: FlutterFlowTheme.primaryColor,
                      dense: true,
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SwitchListTile(
                        value: switchListTileValue2 ??= true,
                        onChanged: (newValue) =>
                            setState(() => switchListTileValue2 = newValue),
                        title: Text(
                          'Есть обременение',
                          style: FlutterFlowTheme.darkNormal16.copyWith(),
                        ),
                        tileColor: FlutterFlowTheme.white,
                        activeColor: FlutterFlowTheme.primaryColor,
                        dense: true,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SwitchListTile(
                        value: switchListTileValue3 ??= true,
                        onChanged: (newValue) =>
                            setState(() => switchListTileValue3 = newValue),
                        title: Text(
                          'Обмен',
                          style: FlutterFlowTheme.darkNormal16.copyWith(),
                        ),
                        tileColor: FlutterFlowTheme.white,
                        activeColor: FlutterFlowTheme.primaryColor,
                        dense: true,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 12, 0, 50),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: HomePageWidget(),
                                  ),
                                );
                              },
                              text: 'Сбросить',
                              options: FFButtonOptions(
                                width: 130,
                                height: 48,
                                color: FlutterFlowTheme.secondaryColor,
                                textStyle:
                                    FlutterFlowTheme.btnTextWhite.copyWith(
                                  color: Colors.white,
                                ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 8,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: SearchResultPageWidget(),
                                  ),
                                );
                              },
                              text: 'ПОИСК',
                              options: FFButtonOptions(
                                width: 130,
                                height: 48,
                                color: FlutterFlowTheme.primaryColor,
                                textStyle:
                                    FlutterFlowTheme.btnTextWhite.copyWith(
                                  color: Colors.white,
                                ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 8,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
